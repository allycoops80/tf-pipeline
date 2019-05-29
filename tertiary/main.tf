module "hosted-zones" {
  source = "../unmanaged-markets"
  account_id   = "591509591202"
  region = "eu-west-2"
  redirect_pool_ip_1 = "54.246.246.95"
}


output blah {
  value = "${module.hosted-zones.example}"
  }