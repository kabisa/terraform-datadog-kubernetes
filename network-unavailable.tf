locals {
  network_unavailable_filter = coalesce(
    var.network_unavailable_filter_override,
    var.filter_str
  )
}

module "network_unavailable" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "Nodes with Network Unavailable"
  query            = "avg(${var.network_unavailable_evaluation_period}):max:kubernetes_state.nodes.by_condition{${local.network_unavailable_filter} AND condition:networkunavailable AND (status:true OR status:unknown)} by {cluster_name,host} > ${var.network_unavailable_critical}"
  alert_message    = "Kubernetes cluster node {{node}} has no network. Meaning it is not accessible"
  recovery_message = "Kubernetes cluster node {{node}} has come back on the network"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.network_unavailable_enabled
  alerting_enabled   = var.network_unavailable_alerting_enabled
  critical_threshold = var.network_unavailable_critical
  # no warning threshold for this monitor
  priority = min(var.network_unavailable_priority + var.priority_offset, 5)
  docs     = var.network_unavailable_docs
  note     = var.network_unavailable_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
