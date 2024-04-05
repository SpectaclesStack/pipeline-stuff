# configured aws provider with proper credentials
provider "aws" {
  region  = "eu-west-1"
}

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
  port                      = 1433
  publicly_accessible       = true
  db_subnet_group_name      = "spectacles-stack-db-subnet-group"
  vpc_security_group_ids    = ["sg-012b3f4f0396e4c9a"]
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

module "ec2-instance" {
  source                       = "terraform-aws-modules/ec2-instance/aws"
  name                         = "spectacles-stack-api-server-instance"
  key_name                     = "spectacle-stacks-api-key"
  instance_type                = "t2.micro"
  ami_ssm_parameter            = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
  vpc_security_group_ids       = ["sg-012b3f4f0396e4c9a"]
  subnet_id                    = "subnet-032070b4837c85e0e"
  associate_public_ip_address  = true
}