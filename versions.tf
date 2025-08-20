terraform {
  required_version = ">= 1.5.0"

  required_providers {
    netlify = {
      source  = "AegirHealth/netlify"
      version = "0.6.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}