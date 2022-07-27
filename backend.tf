terraform {
  backend "s3" {
    bucket         = "talent-academy-subha-lab"
    key            = "talent-academy/My-rds-repo/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}