
# Security Group for EC2 instances
resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.ec2_name}-sg"
  }
}

# Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = {
    Name = "${var.ec2_name}-key"
  }
}

# Placement Group
resource "aws_placement_group" "ec2_placement_group" {
  name     = var.placement_group_name
  strategy = var.placement_group_strategy

  tags = {
    Name = "${var.ec2_name}-placement-group"
  }
}

# Dedicated Host
resource "aws_ec2_host" "ec2_dedicated_host" {
  instance_type = var.dedicated_host_instance_type
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.ec2_name}-dedicated-host"
  }
}

# Elastic IP
resource "aws_eip" "ec2_eip" {

  tags = {
    Name = "${var.ec2_name}-eip"
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.ec2_key.key_name
  security_groups = [aws_security_group.ec2_sg.name]
  associate_public_ip_address = true
  placement_group = aws_placement_group.ec2_placement_group.name
  host_id = aws_ec2_host.ec2_dedicated_host.id

  tags = {
    Name = var.ec2_name
  }
}

# EBS Volume
resource "aws_ebs_volume" "ec2_volume" {
  availability_zone = var.availability_zone
  size              = var.volume_size

  tags = {
    Name = "${var.ec2_name}-volume"
  }
}

# Attach EBS Volume to EC2 Instance
resource "aws_volume_attachment" "ec2_volume_attachment" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ec2_volume.id
  instance_id = aws_instance.main.id
}

# Create Snapshot
resource "aws_ebs_snapshot" "ec2_snapshot" {
  volume_id = aws_ebs_volume.ec2_volume.id
  tags = {
    Name = "${var.ec2_name}-snapshot"
  }
}

# Load Balancer
resource "aws_lb" "ec2_lb" {
  name               = "${var.ec2_name}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [var.subnet_id]

  tags = {
    Name = "${var.ec2_name}-lb"
  }
}

resource "aws_lb_target_group" "ec2_tg" {
  name     = "${var.ec2_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "${var.ec2_name}-tg"
  }
}

resource "aws_lb_listener" "ec2_lb_listener" {
  load_balancer_arn = aws_lb.ec2_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_tg.arn
  }
}

resource "aws_autoscaling_group" "ec2_asg" {
  launch_configuration = aws_launch_configuration.ec2_launch_config.id
  vpc_zone_identifier  = [var.subnet_id]
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
}

resource "aws_launch_configuration" "ec2_launch_config" {
  name          = "${var.ec2_name}-launch-config"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  security_groups = [aws_security_group.ec2_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}
