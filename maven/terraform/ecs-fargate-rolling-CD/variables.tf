variable "region" {
  type = string
  description = "Name of Region"
}
variable "codepipelinename" {
  type        = string
  description = "Name of CodePipeline"
}

variable  "source_bucket_name" {
  type = string
  description = "Name of Source Bucket"
}

variable "S3_bucket_name" {
  type = string
  description = "Name of Bucket"
}

variable "S3ObjectKey" {
  type = string
  description = "Name of Artifact"
}

variable "pollchanges" {
  type = bool
  description = "Poll For Source Changes"
}
variable "cluster_name" {
  type = string
}
variable "service_name" {
  type = string
}
variable "file_name" {
  type = string
}
variable "artifact_store_type" {
  type = string
}
variable "codepipelinearn" {
  type = string
}
variable "artifact_store" {
  type = string
}


