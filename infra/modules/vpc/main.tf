#VPC Resource
#===================================================
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

# AWS internet gateway resource
#====================================================
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "${var.vpc_name}-ig"
  }
}

#AWS public subnet
#======================================================
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  #availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true
}

#AWS private subnet
#======================================================
resource "aws_subnet" "private" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.main.id
  #availability_zone       = var.availability_zone_1
  cidr_block = var.private_subnets[count.index]
}
# AWS NAT gateways
#====================================================
resource "aws_eip" "nat-eip-1" {
  tags = {
    "Name" = "nat-eip-1"
  }
}

resource "aws_nat_gateway" "nat-gw-1" {
  allocation_id = aws_eip.nat-eip-1.id
  subnet_id     = aws_subnet.public.id
  tags = {
    "Name" = "${var.vpc_name}-nat-gw-1"
  }
}

# Routes and route tables
#====================================================
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "${var.vpc_name}-pub-rt"
  }
}

resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.this.id
  tags = {
    "Name" = "${var.vpc_name}-pvt-rt"
  }
}

resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.pvt-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw-1.id
}

resource "aws_route_table_association" "pub-sub-assoc" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pvt-sub-assoc" {
  subnet_id      = aws_subnet.pvt-sub.id
  route_table_id = aws_route_table.pvt-rt-1.id
}


/*output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}*/
