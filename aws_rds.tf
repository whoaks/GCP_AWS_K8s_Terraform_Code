provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.aws_vpc_dns_hostname
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "tf_subnet" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = var.aws_subnet_cidr[0]
  availability_zone = var.aws_availability_zone[0]
  map_public_ip_on_launch = true

  tags = {
    Name = var.aws_subnet_name[0]
  }
}

resource "aws_subnet" "tf_subnet2" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = var.aws_subnet_cidr[1]
  availability_zone = var.aws_availability_zone[1]
  map_public_ip_on_launch = true

  tags = {
    Name = var.aws_subnet_name[1]
  }
}

resource "aws_internet_gateway" "tf_gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = var.aws_ig_name
  }
}

resource "aws_route_table" "tf_rt" {
    vpc_id = aws_vpc.tf_vpc.id

    route {
        gateway_id = aws_internet_gateway.tf_gw.id
        cidr_block = var.allow_all
    }

    tags = {
        Name = var.route_table_name
    }
}

resource "aws_route_table_association" "tf_sub_a" {
    subnet_id      = aws_subnet.tf_subnet.id
    route_table_id = aws_route_table.tf_rt.id
}

resource "aws_route_table_association" "tf_sub_b" {
    subnet_id      = aws_subnet.tf_subnet2.id
    route_table_id = aws_route_table.tf_rt.id
}

resource "aws_security_group" "tf_sg2" {
  depends_on = [ aws_vpc.tf_vpc ]
  name        = var.aws_sg_name
  vpc_id      = aws_vpc.tf_vpc.id

  ingress {
    description = "MYSQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [ var.allow_all ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ var.allow_all ]
  }

  tags = {
    Name = var.aws_sg_tag
  }
}

resource "aws_db_subnet_group" "subnetdb" {
  name       = var.aws_db_subnet_name
  subnet_ids = [ aws_subnet.tf_subnet.id , aws_subnet.tf_subnet2.id ]
}

resource "aws_db_instance" "mydb" {
  
  identifier        = var.db_identifier
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_storage

  db_subnet_group_name    = aws_db_subnet_group.subnetdb.id

  name     = var.database_name
  username = var.database_username
  password = var.database_password
  port     = var.database_port

  vpc_security_group_ids = [ aws_security_group.tf_sg2.id ]

  publicly_accessible = var.db_public_accessible

  iam_database_authentication_enabled = true

  parameter_group_name = var.db_parameter_name

  tags = {
      Name = var.db_tag
  }
}
