# configured aws provider with proper credentials
provider "aws" {
  region  = "eu-west-1"
}

# create default vpc if one does not exist
#resource "aws_default_vpc" "default_vpc" {
#  tags = {
#    Name = "spectacles-stack-vpc"
#  }
#}

# use data source to get all avalablility zones in region
# data "aws_availability_zones" "available_zones" {}
# 
# # create a default subnet in the first az if one does not exist
# resource "aws_default_subnet" "subnet_az1" {
#   availability_zone = data.aws_availability_zones.available_zones.names[0]
# }
# 
# # create a default subnet in the second az if one does not exist
# resource "aws_default_subnet" "subnet_az2" {
#   availability_zone = data.aws_availability_zones.available_zones.names[1]
# }

# create security group for the web server
# resource "aws_security_group" "webserver_security_group" {
#   name        = "spectacle stack api server security group"
#   description = "enable http access on port 8091"
#   vpc_id      = aws_default_vpc.default_vpc.id
# 
#   ingress {
#     description      = "http access"
#     from_port        = 8091 # assuming c# will be using port 8091
#     to_port          = 8091
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# 
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = -1 # can send responses to any port
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# 
#   tags   = {
#     Name = "spectacle stack api server security group"
#   }
# }

# create security group for the database
# resource "aws_security_group" "database_security_group" {
#   name        = "spectacle stack db security group"
#   description = "enable sqlserver/wandile access on port 1433"
#   vpc_id      = aws_default_vpc.default_vpc.id
# 
#   ingress {
#     description      = "sqlserver/wandile access"
#     from_port        = 1433
#     to_port          = 1433
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
# 
#   }
# 
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = -1
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# 
#   tags   = {
#     Name = "spectacle stack db security group"
#   }
# }

# create the subnet group for the rds instance
# resource "aws_db_subnet_group" "database_subnet_group" {
#   name         = "spectacle-stack-db-subnet"
#   subnet_ids   = [aws_default_subnet.subnet_az1.id, aws_default_subnet.subnet_az2.id]
#   description  = "subnets for spectacle-stack db instance"
# 
#   tags   = {
#     Name = "spectacle-stack-db-subnet"
#   }
# }

# create the rds instance
module "db" {
  source = "terraform-aws-modules/rds/aws"
  identifier                = "sectacle-stack-rds-instance"
  engine                    = "sqlserver-ex"
  engine_version            = "16.00"
  family                    = "sqlserver-ex-16.0" # DB parameter group
  major_engine_version      = "16.00"            
  instance_class            = "db.t3.micro"
  allocated_storage         = 20
  max_allocated_storage     = 30
  storage_encrypted         = false
  username                  = "bbdGradWandile"
  password                  = "wandile"
  port                      = 1433
  publicly_accessible       = true
  db_subnet_group_name      = "spectacles-stack-db-subnet-group"
  vpc_security_group_ids    = ["sg-0940ec5d5223a9426"]
  multi_az = false

  maintenance_window        = "Mon:00:00-Mon:03:00"
  backup_window             = "03:00-06:00"
  backup_retention_period   = 1
  skip_final_snapshot       = true
  deletion_protection       = false

  create_db_parameter_group = false
  timezone                  = "GMT Standard Time"
  character_set_name        = "Latin1_General_CI_AS"

  create_db_option_group    = false
}
