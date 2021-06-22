locals {
  memory_limits_low_filter = coalesce(
    var.memory_limits_low_filter_override,
    var.filter_str
  )
}

module "memory_limits_low" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "Available Memory for Limits Low"
  query            = "avg(${var.memory_limits_low_evaluation_period}):max:kubernetes.memory.capacity{${local.memory_limits_low_filter}} by {host,cluster_name} - max:kubernetes.memory.limits{${local.memory_limits_low_filter}} by {host,cluster_name} < ${var.memory_limits_low_critical}"
  alert_message    = "Kubernetes cluster memory room for limits is too low"
  recovery_message = "Kubernetes cluster memory limits is ok again."

  # monitor level vars
  enabled            = var.memory_limits_low_enabled
  alerting_enabled   = var.memory_limits_low_alerting_enabled
  critical_threshold = var.memory_limits_low_critical
  warning_threshold  = var.memory_limits_low_warning
  priority           = var.memory_limits_low_priority
  severity           = var.memory_limits_low_severity
  docs               = var.memory_limits_low_docs
  note               = var.memory_limits_low_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}