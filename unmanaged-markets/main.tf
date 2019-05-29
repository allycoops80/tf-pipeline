variable "region" {}
variable "account_id" {}
variable "redirect_pool_ip_1" {}

variable "skyscannerflights_uk" {
   type = "map"
   default = {
     "www" = "54.246.246.95"
     "test" = "54.246.246.95"
   }
}

variable "domains" {
  default = {
    skyscannerflights_uk = {
      domain = "skyscannerflights.uk"
      resource_records = {
        A = {
          test = "54.246.246.95"
        }
      }
    }
    tripsbyskyscanner_uk = {
      domain = "skyscannerflights.uk"
      resource_records = {
        A = {
          test = "54.246.246.95"
        }
      }
    }
  }
}


resource "aws_cloudformation_stack" "infx-dns-skyscannerflights-uk" {
  name          = "infx-dns-skyscannerflights-uk"
  template_body = "${file("${path.module}/unmanaged-domains.yml")}"

  parameters = {
    Region = "${var.region}"
    BaseDomainName = "skyscannerflights.uk"
    RedirectPoolIP = "${var.redirect_pool_ip_1}"
  }

  tags = {
    Project = "infx"
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}


output "example" {
  value = <<EOT
  %{ for name in var.domains ~}
  ${name.domain}
  %{ endfor ~}
EOT
}
