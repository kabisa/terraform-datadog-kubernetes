locals {
  pod_restarts_filter = coalesce(
    var.pod_restarts_filter_override,
    var.filter_str
  )
}

module "pod_restarts" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "Restarting Pods"
  query            = "change(avg(${var.pod_restarts_evaluation_period}),${var.pod_restarts_evaluation_period}):exclude_null(avg:kubernetes.containers.restarts{${local.pod_restarts_filter}} by {pod_name}) > ${var.pod_restarts_critical}"
  alert_message    = "Pods are restarting multiple times in the last ${var.pod_restarts_evaluation_period}"
  recovery_message = "Pods restarting recovered"

  # monitor level vars
  enabled            = var.pod_restarts_enabled
  alerting_enabled   = var.pod_restarts_alerting_enabled
  critical_threshold = var.pod_restarts_critical
  warning_threshold  = var.pod_restarts_warning
  priority           = min(var.pod_restarts_priority + var.priority_offset, 5)
  docs               = var.pod_restarts_docs
  note               = var.pod_restarts_note

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