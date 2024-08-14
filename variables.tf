variable "region" {
  default = "us-west-2"
}

variable "state_bucket_name" {
  default = "terraform-sam-state-bucket1"
}

variable "artifact_bucket_name" {
  default = "terraform-codepipeline-artificat-bucket2"
}

variable "repo_id" {
  default = "Samarth007-2002/terraform-CI-CD_SOURCE" 
}

variable "branch_name" {
  default = "master"
}
