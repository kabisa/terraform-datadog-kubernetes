locals {
  node_ready_filter = coalesce(
    var.node_ready_filter_override,
    var.filter_str
  )
}

module "node_ready" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "Nodes with ready status"
  query            = "avg(${var.node_ready_evaluation_period}):count_nonzero(sum:kubernetes_state.nodes.by_condition{${local.node_ready_filter} AND (NOT condition:ready) AND (status:true OR status:unknown)} by {cluster_name,host}) > ${var.node_ready_critical}"
  alert_message    = "Kubernetes cluster node {{host}} is not ready."
  recovery_message = "Kubernetes cluster node {{host}} is ready again."

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.node_ready_enabled
  alerting_enabled   = var.node_ready_alerting_enabled
  critical_threshold = var.node_ready_critical
  # no warning threshold for this monitor
  priority = var.node_ready_priority
  severity = var.node_ready_severity
  docs     = var.node_ready_docs
  note     = var.node_ready_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
