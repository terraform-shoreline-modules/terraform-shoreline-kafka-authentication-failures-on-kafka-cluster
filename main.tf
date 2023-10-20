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

module "authentication_failure_in_kafka_cluster_with_sasl_ssl_protocol" {
  source    = "./modules/authentication_failure_in_kafka_cluster_with_sasl_ssl_protocol"

  providers = {
    shoreline = shoreline
  }
}