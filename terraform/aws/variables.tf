variable "region" {
  type        = string
  description = "The AWS region."
  default     = "us-east-1"
}

variable "availability_zone" {
  type        = string
  description = "The AWS availability zone within the region."
  default     = "us-east-1c"
}

variable "vpc_id" {
  type        = string
  description = "The networking VPC ID."
  default     = "vpc-9fc043fa"
}

variable "subnet_id" {
  type        = string
  description = "The networking subnet ID."
  default     = "subnet-39844760"
}

variable "image_id" {
  type        = string
  description = "The AMI of the machine."
  default     = "ami-0e472ba40eb589f49"
}

variable "instance_type" {
  type        = string
  description = "The instance type of the machine."
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "The SSH key name."
  default     = "jklingin"
}
