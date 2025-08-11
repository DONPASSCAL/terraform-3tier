# Web Server (Public)
resource "aws_instance" "web" {
  ami                         = "ami-0d1b5a8c13042c939" # verify this AMI exists in your region
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  # IMPORTANT: SGs by ID in VPC
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = { Name = "Web-Server" }
}

# App Server (Private)
resource "aws_instance" "app" {
  ami               = "ami-0d1b5a8c13042c939"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.app_subnet.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = { Name = "App-Server" }
}

# Database Server (Private)
resource "aws_instance" "db" {
  ami               = "ami-0d1b5a8c13042c939"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.db_subnet.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = { Name = "DB-Server" }
}


