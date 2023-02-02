terraform {
  backend "s3" {
    bucket = "terraform-backendfile-state"
    key    = "ecr/terraform.tfstate"
    region = "us-west-2"
 }
}
