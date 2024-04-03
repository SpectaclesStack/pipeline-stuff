# this file stores variables for the subnet gateway resource

variable "cidr_blocks" {
  default     = "0.0.0.0/0"
  description = "CIDR for sg"
}

variable "sg_name" {
  default     = "spectacle db rds security group"
  description = "Tag Name for sg"
}