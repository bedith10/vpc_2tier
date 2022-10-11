variable "region" {
  description = "Region of AWS vpc"
}

variable "aws_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_vpc_tags" {
  type = map(any)
  default = {
    Name = "my-igw"
  }

}

variable "aws_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"

}

variable "aws_route_table_tags" {
  type = map(any)
  default = {
    Name = "my-route"
  }

}

variable "aws_sybnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"

}
variable "aws_subnet_tags" {
  type = map(any)
  default = {
    Name = "my_subnet"
  }

}