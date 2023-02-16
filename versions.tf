terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws        = ">= 3.40.0"
    local      = ">= 1.4"
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
   }
  }
}