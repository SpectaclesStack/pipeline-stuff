# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "default" {
  depends_on             = [aws_security_group.default]
  identifier             = var.identifier
  allocated_storage      = var.storage
  engine                 = var.engine
  engine_version         = var.engine_version[var.engine]
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [var.vpc_security_group_one, var.vpc_security_group_two]
  db_subnet_group_name   = aws_db_subnet_group.default.id # 
  db_name                = var.db_name
}

resource "aws_db_subnet_group" "default" {
  name        = "spectacle-stack-db-subnet"
  description = "subnets for spectacle-stack db instance"
  subnet_ids  = [var.db_subnet_id_one, var.db_subnet_id_two] 
}