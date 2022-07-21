locals {
  node_status_filter = coalesce(
    var.node_status_filter_override,
    var.filter_str
  )
}

module "node_status" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name                = "Node Status not OK"
  query               = "avg(${var.node_status_evaluation_period}):avg:kubernetes_state.node.status{${local.node_status_filter}} by {cluster_name,node} < 1"
  alert_message       = "Kubernetes Node Status for Node {{node}} is not ok"
  recovery_message    = "Kubernetes Node Status for Node {{node}} has recovered"
  require_full_window = false

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.node_status_enabled
  alerting_enabled   = var.node_status_alerting_enabled
  critical_threshold = 1
  # No warning possible for status that is either 0 or 1
  priority = min(var.node_status_priority + var.priority_offset, 5)
  docs     = var.node_status_docs
  note     = var.node_status_note

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
