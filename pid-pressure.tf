locals {
  pid_pressure_filter = coalesce(
    var.pid_pressure_filter_override,
    var.filter_str
  )
}

module "pid_pressure" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Nodes with PID Pressure"
  query            = "avg(${var.pid_pressure_evaluation_period}):max:kubernetes_state.node.by_condition{${local.pid_pressure_filter} AND condition:pidpressure AND (status:true OR status:unknown)} by {kube_cluster_name,host} > ${var.pid_pressure_critical}"
  alert_message    = "Kubernetes cluster node {{node}} has PID Pressure, meaning it may not be able to start more containers"
  recovery_message = "Kubernetes cluster node {{node}} n olonger has pid pressure."

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.pid_pressure_enabled
  alerting_enabled   = var.pid_pressure_alerting_enabled
  critical_threshold = var.pid_pressure_critical
  # no warning threshold for this monitor
  priority = min(var.pid_pressure_priority + var.priority_offset, 5)
  docs     = var.pid_pressure_docs
  note     = var.pid_pressure_note

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
