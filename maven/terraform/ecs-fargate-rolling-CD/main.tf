resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipelinename
  role_arn = data.aws_arn.codepipelinearn.arn

  artifact_store {
    location = data.aws_s3_bucket.codepipeline_bucket_object.bucket
    type     = var.artifact_store_type
  }

  stage {
    name = "Source"

    action {
      name             = var.source_bucket_name
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["SourceS3Output"]

      configuration = {
        S3Bucket = var.S3_bucket_name
        S3ObjectKey = var.S3ObjectKey
        PollForSourceChanges = var.pollchanges
      }
      run_order = 1
    }

  }

  stage {
    name = "Deploy"

    action {
      name            = "BucketSource"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["SourceS3Output"]
      version         = "1"

      configuration = {
        ClusterName   = var.cluster_name
        ServiceName   = var.service_name
        FileName      = var.file_name

      }
      run_order = 1
    }
  }
}

data "aws_arn" "codepipelinearn" {
  arn = var.codepipelinearn
}
 
data "aws_s3_bucket" "codepipeline_bucket_object" {
  bucket = var.artifact_store
}