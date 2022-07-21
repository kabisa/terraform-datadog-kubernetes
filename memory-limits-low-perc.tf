locals {
  memory_limits_low_perc_filter = coalesce(
    var.memory_limits_low_perc_filter_override,
    var.filter_str
  )
}

module "memory_limits_low_perc" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Available Memory for Limits in percentage Low"
  query            = "max(${var.memory_limits_low_perc_evaluation_period}):( max:kubernetes.memory.limits{${local.memory_limits_low_perc_filter}}  by {host,cluster_name}/ max:system.mem.total{${local.memory_limits_low_perc_filter}} by {host,cluster_name}) * 100 > ${var.memory_limits_low_perc_critical}"
  alert_message    = "Kubernetes cluster memory room for limits in percentage is too low"
  recovery_message = "Kubernetes cluster memory limits in percentage has recovered"

  # monitor level vars
  enabled            = var.memory_limits_low_perc_enabled
  alerting_enabled   = var.memory_limits_low_perc_alerting_enabled
  critical_threshold = var.memory_limits_low_perc_critical
  warning_threshold  = var.memory_limits_low_perc_warning
  priority           = min(var.memory_limits_low_perc_priority + var.priority_offset, 5)
  docs               = var.memory_limits_low_perc_docs
  note               = var.memory_limits_low_perc_note

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
