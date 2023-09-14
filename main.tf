terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "authentication_failure_on_kafka_cluster" {
  source    = "./modules/authentication_failure_on_kafka_cluster"

  providers = {
    shoreline = shoreline
  }
}