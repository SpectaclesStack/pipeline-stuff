# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
provider "aws" {
  region = var.aws_region
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

  # depends_on              = [aws_security_group.default]
  # Encryption at rest is not available for DB instances running SQL Server Express Edition
  storage_encrypted         = false
  publicly_accessible       = true
  maintenance_window        = "Mon:00:00-Mon:03:00"
  backup_window             = "03:00-06:00"

  identifier                = var.identifier
  allocated_storage         = var.storage
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  db_name                   = var.db_name
  username                  = var.username
  password                  = var.password
  vpc_security_group_ids    = [var.vpc_security_group]
  backup_retention_period   = 1
  skip_final_snapshot       = true
  deletion_protection       = false

  create_db_parameter_group = false
  timezone                  = "GMT Standard Time"
  character_set_name        = "Latin1_General_CI_AS"

  create_db_option_group    = false
}
