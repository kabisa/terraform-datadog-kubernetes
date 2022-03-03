locals {
  pid_pressure_filter = coalesce(
    var.pid_pressure_filter_override,
    var.filter_str
  )
}

module "pid_pressure" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.1"

  name             = "Nodes with PID Pressure"
  query            = "avg(${var.pid_pressure_evaluation_period}):max:kubernetes_state.nodes.by_condition{${local.pid_pressure_filter} AND condition:pidpressure AND (status:true OR status:unknown)} by {cluster_name,host} > ${var.pid_pressure_critical}"
  alert_message    = "Kubernetes cluster node {{node}} has PID Pressure, meaning it may not be able to start more containers"
  recovery_message = "Kubernetes cluster node {{node}} n olonger has pid pressure."

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.pid_pressure_enabled
  alerting_enabled   = var.pid_pressure_alerting_enabled
  critical_threshold = var.pid_pressure_critical
  # no warning threshold for this monitor
  priority = var.pid_pressure_priority
  docs     = var.pid_pressure_docs
  note     = var.pid_pressure_note

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
