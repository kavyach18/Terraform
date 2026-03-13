variable "ami_id" {
  description = "AMI ID value"
  type = string
}

variable "instance_type" {
   description = "type of instance used"
   type = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}
