locals {
  memory_limits_low_filter = coalesce(
    var.memory_limits_low_filter_override,
    var.filter_str
  )
}

module "memory_limits_low" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Available Memory for Limits Low"
  query            = "avg(${var.memory_limits_low_evaluation_period}):max:system.mem.total{${local.memory_limits_low_filter}} by {host,cluster_name} - max:kubernetes.memory.limits{${local.memory_limits_low_filter}} by {host,cluster_name} < ${var.memory_limits_low_critical}"
  alert_message    = "Kubernetes cluster memory room for limits is too low"
  recovery_message = "Kubernetes cluster memory limits has recovered"

  # monitor level vars
  enabled            = var.memory_limits_low_enabled
  alerting_enabled   = var.memory_limits_low_alerting_enabled
  critical_threshold = var.memory_limits_low_critical
  warning_threshold  = var.memory_limits_low_warning
  priority           = min(var.memory_limits_low_priority + var.priority_offset, 5)
  docs               = var.memory_limits_low_docs
  note               = var.memory_limits_low_note

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
