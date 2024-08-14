provider "aws" {
  region = var.region
}

module "s3_artifacts" {
  source      = "./modules/s3"
  bucket_name = var.artifact_bucket_name
}

module "iam" {
  source = "./modules/iam"
}

module "codebuild" {
  source           = "./modules/codebuild"
  codebuild_role_arn = module.iam.codebuild_role_arn
  region           = "us-west-1"
  buildspec        = file("buildspec.yml")
}

module "codepipeline" {
  source               = "./modules/codepipeline"
  codepipeline_role_arn = module.iam.codepipeline_role_arn
  artifact_bucket_name = module.s3_artifacts.s3_bucket_id
  codebuild_project_name = module.codebuild.codebuild_project_name
}
