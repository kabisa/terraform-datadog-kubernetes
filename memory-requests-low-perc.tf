locals {
  memory_requests_low_perc_filter = coalesce(
    var.memory_requests_low_perc_filter_override,
    var.filter_str
  )
}

module "memory_requests_low_perc" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Available Memory for Requests in percentage Low"
  query            = "max(${var.cpu_requests_low_perc_evaluation_period}):( max:kubernetes.memory.requests{${local.cpu_requests_low_perc_filter}} / max:system.mem.total{${local.cpu_requests_low_perc_filter}} ) * 100 > ${var.cpu_requests_low_perc_critical}"
  alert_message    = "Kubernetes cluster memory room for Requests in percentage is too low"
  recovery_message = "Kubernetes cluster memory Requests in percentage has recovered"

  # monitor level vars
  enabled            = var.memory_requests_low_perc_enabled
  alerting_enabled   = var.memory_requests_low_perc_alerting_enabled
  critical_threshold = var.memory_requests_low_perc_critical
  warning_threshold  = var.memory_requests_low_perc_warning
  priority           = min(var.memory_requests_low_perc_priority + var.priority_offset, 5)
  docs               = var.memory_requests_low_perc_docs
  note               = var.memory_requests_low_perc_note

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
