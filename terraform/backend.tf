terraform {
  backend "s3" {
    bucket = "aws-notificator-tfstate"
    key    = "aws-notificator/infra"
    region = "us-east-1"
  }
}