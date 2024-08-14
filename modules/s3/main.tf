resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name
    tags = {
        Name = "Terraformstatebucket"
        
    }
  
}




resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
