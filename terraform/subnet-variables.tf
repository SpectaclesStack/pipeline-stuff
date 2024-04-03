# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "subnet_1_cidr" {
  default     = "0.0.0.0/0"
  description = "Your AZ"
}

variable "subnet_2_cidr" {
  default     = "0.0.0.0/0"
  description = "Your AZ"
}

variable "az_1" {
  default     = "eu-west-1"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "eu-west-1"
  description = "Your Az2, use AWS CLI to find your account specific"
}

variable "vpc_id" {
  description = "Your VPC ID"
}