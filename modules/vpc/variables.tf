variable "vpc_cidr" {
  description = "VPC cidr range"
  type = string
}

variable "public_subnet_cidr" {
  description = "public_subnet_cidr"
  type = string
}

variable "private_subnet_cidr" {
  description = "private_subnet_cidr"
  type = string
}

variable "route_table" {
  description = "route_table"
  type = string
}