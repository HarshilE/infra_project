variable "general_purpose_bucket_name" {
  description = "Name for the general purpose S3 bucket"
  type        = string
}

variable "directory_bucket_name" {
  description = "Name for the directory S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment in which the resources are deployed (e.g., dev, prod)"
  type        = string
}
