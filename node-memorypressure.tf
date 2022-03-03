locals {
  node_memorypressure_filter = coalesce(
    var.node_memorypressure_filter_override,
    var.filter_str
  )
}

module "node_memorypressure" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "Nodes with Memorypressure"
  query            = "avg(${var.node_memorypressure_evaluation_period}):max:kubernetes_state.nodes.by_condition{${local.node_memorypressure_filter} AND condition:memorypressure AND (status:true OR status:unknown)} by {cluster_name,host} > ${var.node_memorypressure_critical}"
  alert_message    = "Kubernetes cluster node {{node}} has memorypressure. Meaning it is low on memory"
  recovery_message = "Kubernetes cluster node {{node}} no longer has Memory Pressure."

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.node_memorypressure_enabled
  alerting_enabled   = var.node_memorypressure_alerting_enabled
  critical_threshold = var.node_memorypressure_critical
  # no warning threshold for this monitor
  priority = var.node_memorypressure_priority
  docs     = var.node_memorypressure_docs
  note     = var.node_memorypressure_note

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
