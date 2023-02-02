#---------------------------------------------------------------------------------------------------------
# This is called the variable file for dev environment from where we pass the variable values to the main.tf terraform file.
#---------------------------------------------------------------------------------------------------------
region = "us-west-2"


repositoryName = "app_modernization/ecr_repo"


image_tag_mutability = "MUTABLE"


scan_on_push = false


component = "JD-SME"

