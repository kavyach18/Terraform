resource "aws_vpc" "vpc-terraform-module" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "vpc-terraform-module"
    }
  
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = "${aws_vpc.vpc-terraform-module.id}"
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
    tags = {
      Name = "public_subnet_1"
    }
  
}

resource "aws_internet_gateway" "gateway-vpc" {
    vpc_id = "${aws_vpc.vpc-terraform-module.id}"
    tags = {
      Name = "internet-gateway-vpc"
    }
}


resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.vpc-terraform-module.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_route_table.public_route.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway-vpc.id}"
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}