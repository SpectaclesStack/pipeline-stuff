# provider "aws" {
#   region = var.aws_region
# }
# module "db" {
#   source = "terraform-aws-modules/rds/aws"
#   identifier                = "sectacle-stack-rds-instance"
#   engine                    = "sqlserver-ex"
#   engine_version            = "16.00"
#   family                    = "sqlserver-ex-16.0" # DB parameter group
#   major_engine_version      = "16.00"            
#   instance_class            = "db.t3.micro"
#   allocated_storage         = 20
#   max_allocated_storage     = 30
#   storage_encrypted         = false
#   username                  = "bbdGradWandile"
#   password                  = "wandile"
#   port                      = 1433
#   publicly_accessible       = true
#   db_subnet_group_name      = aws_db_subnet_group.database_subnet_group.name
#   vpc_security_group_ids    = [aws_security_group.database_security_group.id]
#   multi_az = false
# 
#   maintenance_window        = "Mon:00:00-Mon:03:00"
#   backup_window             = "03:00-06:00"
#   backup_retention_period   = 1
#   skip_final_snapshot       = true
#   deletion_protection       = false
# 
#   create_db_parameter_group = false
#   timezone                  = "GMT Standard Time"
#   character_set_name        = "Latin1_General_CI_AS"
# 
#   create_db_option_group    = false
# }