locals {
  memory_limits_low_perc_state_filter = coalesce(
    var.memory_limits_low_perc_state_filter_override,
    var.filter_str
  )
}

module "memory_limits_low_perc_state" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "Available Memory for Limits in percentage Low"
  query            = "max(${var.memory_limits_low_perc_state_evaluation_period}):( sum:kubernetes_state.container.memory_limit{${local.memory_limits_low_perc_state_filter}} by {host,cluster_name} / sum:kubernetes_state.node.memory_allocatable{${local.memory_limits_low_perc_state_filter}} by {host,cluster_name}) * 100 > ${var.memory_limits_low_perc_state_critical}"
  alert_message    = "Kubernetes cluster memory room for limits in percentage is too low"
  recovery_message = "Kubernetes cluster memory limits in percentage has recovered"

  # monitor level vars
  enabled            = var.memory_limits_low_perc_state_enabled
  alerting_enabled   = var.memory_limits_low_perc_state_alerting_enabled
  critical_threshold = var.memory_limits_low_perc_state_critical
  warning_threshold  = var.memory_limits_low_perc_state_warning
  priority           = var.memory_limits_low_perc_state_priority
  docs               = var.memory_limits_low_perc_state_docs
  note               = var.memory_limits_low_perc_state_note

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
