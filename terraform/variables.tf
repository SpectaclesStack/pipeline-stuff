# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "aws_region" {
  default = "eu-west-1"
}

variable "identifier" {
  default     = "sectacle-stack-rds-instance"
  description = "Identifier for your DB"
}

variable "storage" {
  default     = "20"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "sqlserver-ex"
  description = "Engine type, SQL server type"
}

variable "engine_version" {
  description = "Engine version"
  default = "16.00"
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "Instance class"
}

variable "db_name" {
  default     = "mydb"
  description = "db name"
}

variable "username" {
  default     = "bbdGradWandile"
  description = "User name"
}

variable "password" {
  default     = "wandile"
  description = "password is variable for now"
}

variable "vpc_security_group_one" {
    default = "sg-06554e50a645995ee"
}

variable "vpc_security_group_two" {
    default = "sg-0a17fd32633a462e6"
}

variable "db_subnet_id_one" {
    default = "subnet-0c7083d355715cb1b"
}

variable "db_subnet_id_two" {
    default = "subnet-0abbe4dbf1c33983c"
}

variable "db_availability_zone" {
  default = "eu-west-1a"
}