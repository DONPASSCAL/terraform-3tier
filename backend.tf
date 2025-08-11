terraform {
  backend "s3" {
    bucket         = "don-terraform-state-bucket-2025"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-lock"
  }
}


