terraform {
  backend "s3" {
    bucket = "appmodernization-terraform-backend"
    key    = "ecs-rolling/terraform.tfstate"
    region = "us-west-2"
  }
}