### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "khatrig-githubaction"
    key = "openapi.tfstate"
    region = "us-east-1"
  }
}
