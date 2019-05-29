provider "aws" {
    region                  = "${var.region}"
    # shared_credentials_file = "~/.aws/credentials"
    # profile                 = "${var.masterbilling_profile}"
    
    # assume_role {
    #     role_arn     = "arn:aws:iam::${var.account_id}:role/${var.terraform_role}"
    #     session_name = "terraform"
    # }
}