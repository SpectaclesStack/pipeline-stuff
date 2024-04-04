terraform {
  backend "s3" {
    bucket  = "spectacle-stack-tfstate-bucket" # name of the s3 bucket you created
    key     = "csharplevelup/terraform.tfstate"
    region  = "eu-west-1"
  }
}