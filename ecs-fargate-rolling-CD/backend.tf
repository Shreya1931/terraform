#configure backend

terraform {
  backend "s3" {
    bucket = "appmodernization-terraform-backend"
    key    = "codepipelineecsrolling/terraform.tfstate"
    region = "us-west-2"
  }
}