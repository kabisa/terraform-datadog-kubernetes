locals {
  node_status_filter = coalesce(
    var.node_status_filter_override,
    var.filter_str
  )
}

module "node_status" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Node Status not OK"
  query = "avg(${var.node_status_evaluation_period}):avg:kubernetes_state.node.status{${local.node_status_filter}} by {cluster_name,node} < 1"

  enabled          = var.node_status_enabled
  alerting_enabled = var.node_status_alerting_enabled

  alert_message    = "Kubernetes Node Status for Node {{node}} is not ok"
  recovery_message = "Kubernetes Node Status for Node {{node}} has recovered"

  service         = var.service
  env             = var.alert_env
  severity        = var.node_status_severity
  note            = var.node_status_note
  docs            = var.node_status_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false

  critical_threshold = 1
  locked             = var.locked
}
