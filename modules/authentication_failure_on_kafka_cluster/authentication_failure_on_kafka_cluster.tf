resource "shoreline_notebook" "authentication_failure_on_kafka_cluster" {
  name       = "authentication_failure_on_kafka_cluster"
  data       = file("${path.module}/data/authentication_failure_on_kafka_cluster.json")
  depends_on = []
}

