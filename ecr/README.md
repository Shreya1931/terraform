Terraform module for AWS ECR Resource.

Resources created by module - aws_ecr_repository, aws_ecr_repository_policy
Data fetched: template_file (File name: "resources/policy.json")

ECR properties: image_scanning_configuration.

Prerequisites

* Following values are required:

region, repositoryName, image_tag_mutability, scan_on_push, component.

For example -

# AWS region
region = "us-west-2"

# Repository Name
repositoryName = "ecr_repo"

# Image Tag Mutability
image_tag_mutability = "MUTABLE" 
# or IMMUTABLE. Defaults to MUTABLE

# scan_on_push: 
# Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)
scan_on_push = false

# Component Tag (Required)
# This tag is used for Billing purposes and is a required tag. 
component = "JD-SME"

Usage -

1. Specify the values for the arguments & variables declared in dev.tfvars present under env_params folder. 

2. cert.tfvars, qual.tfvars and prod.tfvars will have nothing as Registry is created once in the dev.tfvars.

3. Required permissions are granted through policy.json file in the resources folder.

3. Pass the parameter file to terraform commands terraform plan -var-file="env_params/dev.tfvars"