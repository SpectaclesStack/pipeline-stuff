# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
# 
# resource "aws_subnet" "subnet_1" {
#   vpc_id            = aws_default_vpc.default_vpc.id
#   cidr_block        = var.subnet_1_cidr
#   availability_zone = var.az_1
# 
#   tags = {
#     Name = "sectacles db subnet 1"
#   }
# }
# 
# resource "aws_subnet" "subnet_2" {
#   vpc_id            = aws_default_vpc.default_vpc.id
#   cidr_block        = var.subnet_2_cidr
#   availability_zone = var.az_2
# 
#   tags = {
#     Name = "sectacles db subnet 2"
#   }
# }