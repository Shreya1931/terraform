resource "aws_ecr_repository" "aws_ecr" {
  name                 = var.repositoryName
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = {
    Name      = var.repositoryName
    component = var.component
    }
}

# data "template_file" "ecr_policy"{
#     template = file("resources/policy.json")
# }

# resource "aws_ecr_repository_policy" "aws_ecr_policy" {
#   repository = aws_ecr_repository.aws_ecr.name

#   policy = data.template_file.ecr_policy.rendered
# }

resource "aws_ecr_lifecycle_policy" "untaggedImagePolicy" {
  repository = aws_ecr_repository.aws_ecr.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_lifecycle_policy" "taggedimagepolicy" {
  repository = aws_ecr_repository.aws_ecr.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}