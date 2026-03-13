terraform {
  backend "s3" {

    bucket         = "terraform-state-file-1824"
    key            = "modules-terraform-01/terraform.tfstate"
    region         = "ap-south-1"

    dynamodb_table = "terraform-locking-18"

    encrypt = true
  }
}