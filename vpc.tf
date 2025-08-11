resource "aws_vpc" "main_vpc" {
cidr_block = "10.0.0.0/16"
tags = { Name = "3Tier-VPC" }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
vpc_id = aws_vpc.main_vpc.id
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = true
availability_zone = "us-east-2a"
tags = { Name = "Public-Subnet" }
}

# Private App Subnet
resource "aws_subnet" "app_subnet" {
vpc_id = aws_vpc.main_vpc.id
cidr_block = "10.0.2.0/24"
availability_zone = "us-east-2a"
tags = { Name = "App-Subnet" }
}

# Private DB Subnet
resource "aws_subnet" "db_subnet" {
vpc_id = aws_vpc.main_vpc.id
cidr_block = "10.0.3.0/24"
availability_zone = "us-east-2a"
tags = { Name = "DB-Subnet" }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main_vpc.id
tags = { Name = "InternetGateway" }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
vpc_id = aws_vpc.main_vpc.id
}

# Public Route to Internet Gateway
resource "aws_route" "internet_access" {
route_table_id = aws_route_table.public_rt.id
destination_cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}

# Associate Public Route Table to Public Subnet
resource "aws_route_table_association" "public_assoc" {
subnet_id = aws_subnet.public_subnet.id
route_table_id = aws_route_table.public_rt.id
}

