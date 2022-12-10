resource "aws_vpc" "development-vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.environment}-VPC"
  }
}
resource "aws_subnet" "public-subnet-1" {
  cidr_block        = "${var.public_subnet_1_cidr}"
  vpc_id            = "${aws_vpc.development-vpc.id}"
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.environment}-Public-Subnet-1"
  }
}
resource "aws_subnet" "public-subnet-2" {
  cidr_block        = "${var.public_subnet_2_cidr}"
  vpc_id            = "${aws_vpc.development-vpc.id}"
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.environment}-Public-Subnet-2"
  }
}
resource "aws_subnet" "private-subnet-1" {
  cidr_block        = "${var.private_subnet_1_cidr}"
  vpc_id            = "${aws_vpc.development-vpc.id}"
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.environment}-Private-Subnet-1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  cidr_block        = "${var.private_subnet_2_cidr}"
  vpc_id            = "${aws_vpc.development-vpc.id}"
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.environment}-Private-Subnet-2"
  }
}
resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.development-vpc.id}"
  tags = {
    Name = "${var.environment}-Public-RouteTable"
  }
}
resource "aws_route_table_association" "public-route-1-association" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.public-subnet-1.id}"
}
resource "aws_route_table_association" "public-route-2-association" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.public-subnet-2.id}"
}
resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.development-vpc.id}"
  tags = {
    Name = "${var.environment}-Private-RouteTable"
  }
}
resource "aws_route_table_association" "private-route-1-association" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  subnet_id      = "${aws_subnet.private-subnet-1.id}"
}
resource "aws_route_table_association" "private-route-2-association" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  subnet_id      = "${aws_subnet.private-subnet-2.id}"
}
resource "aws_internet_gateway" "development-igw" {
  vpc_id = "${aws_vpc.development-vpc.id}"
  tags = {
    Name = "${var.environment}-IGW"
  }
}