locals {
  cpu_limits_low_filter = coalesce(
    var.cpu_limits_low_filter_override,
    var.filter_str
  )
}

module "cpu_limits_low" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "Available CPU for Limits Low"
  query            = "max(${var.cpu_limits_low_evaluation_period}):sum:kubernetes.cpu.capacity{${local.cpu_limits_low_filter}} by {host,cluster_name} - sum:kubernetes.cpu.limits{${local.cpu_limits_low_filter}} by {host,cluster_name} < ${var.cpu_limits_low_critical}"
  alert_message    = "Kubernetes cluster cpu room for limits is too low"
  recovery_message = "Kubernetes cluster cpu limits has recovered"

  # monitor level vars
  enabled            = var.cpu_limits_low_enabled
  alerting_enabled   = var.cpu_limits_low_alerting_enabled
  critical_threshold = var.cpu_limits_low_critical
  warning_threshold  = var.cpu_limits_low_warning
  priority           = var.cpu_limits_low_priority
  docs               = var.cpu_limits_low_docs
  note               = var.cpu_limits_low_note

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
