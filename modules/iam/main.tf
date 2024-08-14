resource "aws_iam_role" "codebuild_role" {
  name = "code_build"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name   = "codebuild-policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "s3:GetObject",
            "s3:PutObject",
            "logs:PutLogEvents",
            "logs:CreateLogStream",
            "logs:CreateLogGroup"
          ]
          Resource = ["*"]
        },
        {
          Effect = "Allow"
          Action = [
            "codebuild:StartBuild",
            "codebuild:BatchGetBuilds"
          ]
          Resource = ["*"]
        },
        {
          Effect = "Allow"
          Action = [
            "ec2:*"
          ]
          Resource = ["*"]
        },
        {
          Effect = "Allow"
          Action = [
            "iam:ListAttachedRolePolicies",
            "iam:ListAttachedUserPolicies",
            "iam:ListAttachedGroupPolicies",
            "iam:GetPolicy",
            "iam:GetPolicyVersion",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:GetUser",
            "iam:GetUserPolicy"
          ]
          Resource = ["*"]
        }
      ]
    })
  }
}
resource "aws_iam_role" "codepipeline_role" {
  name = "code_pipeline"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name   = "codepipeline-policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "s3:GetObject",
            "s3:PutObject",
            "codebuild:StartBuild",
            "codebuild:BatchGetBuilds",
            "codepipeline:PutActionRevision",
            "codepipeline:PutApprovalResult",
            "codepipeline:GetPipelineExecution",
            "codepipeline:GetPipeline",
            "codepipeline:GetPipelineState",
            "codepipeline:ListPipelineExecutions",
            "codepipeline:ListPipelines",
            "codestar-connections:UseConnection"
          ]
          Resource = ["*"]
        },
                {
          Effect = "Allow"
          Action = [
            "iam:ListAttachedRolePolicies",
            "iam:ListAttachedUserPolicies",
            "iam:ListAttachedGroupPolicies",
            "iam:GetPolicy",
            "iam:GetPolicyVersion",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:GetUser",
            "iam:GetUserPolicy"
          ]
          Resource = ["*"]
        }
      ]
    })
  }
}
