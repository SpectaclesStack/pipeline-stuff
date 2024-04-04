
provider "aws" {
  region = var.aws_region
  # default_tags {
  #   tags = {
  #     owner         = "Wandile.Nyembe@bbd.co.za"
  #     created-using = "Terraform"
  #   }
  # }
}

# create default vpc if one does not exist
# resource "aws_default_vpc" "default_vpc" {
#   tags = {
#     Name = "default vpc"
#   }
# }

# resource "aws_db_subnet_group" "default_subnet" {
#   name        = "main_subnet_group"
#   description = "Our main group of subnets"
#   subnet_ids  = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
# 
#   tags   = {
#     Name = "spectacle-stack-db-subnet"
#   }
# }

module "db" {
  source = "terraform-aws-modules/rds/aws"
  identifier                = var.identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  family                    = "sqlserver-ex-16.0" # DB parameter group
  major_engine_version      = "16.00"             
  instance_class            = var.instance_class
  allocated_storage         = var.storage
  storage_encrypted         = false
  username                  = var.username
  password                  = var.password
  publicly_accessible       = true
  vpc_security_group_ids    = [var.vpc_security_group]
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
