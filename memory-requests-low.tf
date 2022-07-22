locals {
  memory_requests_low_filter = coalesce(
    var.memory_requests_low_filter_override,
    var.filter_str
  )
}

module "memory_requests_low" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Available Memory for Requests Low"
  query            = "avg(${var.memory_requests_low_evaluation_period}):max:system.mem.total{${local.memory_requests_low_filter}} by {host,cluster_name} - max:kubernetes.memory.requests{${local.memory_requests_low_filter}} by {host,cluster_name} < ${var.memory_requests_low_critical}"
  alert_message    = "Total memory available for requests on {{ host }} is low ({{value}})"
  recovery_message = "Total memory available for requests on {{ host }} has recovered ({{value}})"

  # monitor level vars
  enabled            = var.memory_requests_low_enabled
  alerting_enabled   = var.memory_requests_low_alerting_enabled
  critical_threshold = var.memory_requests_low_critical
  warning_threshold  = var.memory_requests_low_warning
  priority           = min(var.memory_requests_low_priority + var.priority_offset, 5)
  docs               = var.memory_requests_low_docs
  note               = var.memory_requests_low_note

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
