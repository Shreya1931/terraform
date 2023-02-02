terraform {
  backend "s3" {
    bucket = "appmodernization-terraform-backend"
    key    = "ecr/terraform.tfstate"
    region = "us-west-2"
  }
}