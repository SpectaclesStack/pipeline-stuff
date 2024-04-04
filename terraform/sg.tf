# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# resource "aws_security_group" "default" {
#   name        = "spectacle stack db security group"
#   description = "Allow all inbound traffic"
#   vpc_id      = aws_default_vpc.default_vpc.id
# 
#   ingress {
#     description = "http access"
#     from_port   = 1433 # assuming c# will be using port 8091
#     to_port     = 1433
#     protocol    = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# 
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# 
#   tags = {
#     Name = var.sg_name
#   }
# }

locals {
  name     = "rent-a-crowd-mssql"
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = local.name

  engine               = "sqlserver-ex"
  engine_version       = "16.00"
  family               = "sqlserver-ex-16.0" # DB parameter group
  major_engine_version = "16.00"             # DB option group
  instance_class       = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 30

  # Encryption at rest is not available for DB instances running SQL Server Express Edition
  storage_encrypted = false

  username = "bbdRentACrowd"
  port     = 1433
  publicly_accessible = true
  vpc_security_group_ids = ["sg-0762cb989ab919d6d"]

  multi_az = false

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  create_db_parameter_group = false
  timezone                  = "GMT Standard Time"
  character_set_name        = "Latin1_General_CI_AS"

  create_db_option_group = false
}