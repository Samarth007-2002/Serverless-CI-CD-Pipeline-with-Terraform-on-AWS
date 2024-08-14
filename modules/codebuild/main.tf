resource "aws_codebuild_project" "terraform_build" {
  name           = "TerraformBuild"
  service_role   = var.codebuild_role_arn
  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "TF_VAR_region"
      value = var.region
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/Samarth007-2002/terraform_CI-CD_SOURCE"
    buildspec       = var.buildspec
  }

  logs_config {
    cloudwatch_logs {
      group_name = "/aws/codebuild/TerraformBuild"
      stream_name = "build"
    }
  }
}

variable "codebuild_role_arn" {}
variable "region" {}
variable "buildspec" {}
