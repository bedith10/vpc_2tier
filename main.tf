

resource "aws_vpc" "main_vpc" {
  cidr_block = var.aws_vpc_cidr_block
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "my-igw"
  }
}

  resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.main_vpc.id
   

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
      
    }
    tags = {
      Name = "my-route"
    }
  }


  ###data source###################################
  data "aws_availability_zones" "available" {
    state = "available"
  }
  ################################################

  resource "aws_subnet" "subnet" {
    vpc_id                  = aws_vpc.main_vpc.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = data.aws_availability_zones.available.names[1]
    tags = {
      Name = "my_subnet"
    }
  }




