resource "shoreline_notebook" "authentication_failure_in_kafka_cluster_with_sasl_ssl_protocol" {
  name       = "authentication_failure_in_kafka_cluster_with_sasl_ssl_protocol"
  data       = file("${path.module}/data/authentication_failure_in_kafka_cluster_with_sasl_ssl_protocol.json")
  depends_on = [shoreline_action.invoke_check_credentials]
}

resource "shoreline_file" "check_credentials" {
  name             = "check_credentials"
  input_file       = "${path.module}/data/check_credentials.sh"
  md5              = filemd5("${path.module}/data/check_credentials.sh")
  description      = "Check the credentials being used for authentication and verify that they are correct."
  destination_path = "/tmp/check_credentials.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_check_credentials" {
  name        = "invoke_check_credentials"
  description = "Check the credentials being used for authentication and verify that they are correct."
  command     = "`chmod +x /tmp/check_credentials.sh && /tmp/check_credentials.sh`"
  params      = ["USERNAME","PASSWORD"]
  file_deps   = ["check_credentials"]
  enabled     = true
  depends_on  = [shoreline_file.check_credentials]
}

