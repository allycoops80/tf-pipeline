terraform {
  backend "s3" {
    bucket  = "bucket=infx-tf-codepipeline-terraformstatebucket-1fd9kzua1hz9v"
    key     = "dns-hub/dns-hub-tertiary.tfstate"

    region  = "eu-west-1"

  }
}
