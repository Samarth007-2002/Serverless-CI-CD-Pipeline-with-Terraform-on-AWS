terraform {
  backend "s3" {
    bucket = "terraform-sam-state-bucket1"
    key = "prod/terraform.tfstate"
    region ="us-west-1"    
  }
}