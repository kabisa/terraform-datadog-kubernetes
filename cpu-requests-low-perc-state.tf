locals {
  cpu_requests_low_perc_state_filter = coalesce(
    var.cpu_requests_low_perc_state_filter_override,
    var.filter_str
  )
}

module "cpu_requests_low_perc_state" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "Available CPU for requests in percentages Low"
  query            = "max(${var.cpu_requests_low_perc_state_evaluation_period}):( sum:kubernetes_state.container.cpu_requested{${local.cpu_requests_low_perc_state_filter}} by {host,cluster_name} / sum:kubernetes_state.node.cpu_capacity{${local.cpu_requests_low_perc_state_filter}} by {host,cluster_name} ) * 100 > ${var.cpu_requests_low_perc_state_critical}"
  alert_message    = "Kubernetes cluster cpu room for requests / percentage is too low"
  recovery_message = "Kubernetes cluster cpu requests / percentage has recovered"

  # monitor level vars
  enabled            = var.cpu_requests_low_perc_state_enabled
  alerting_enabled   = var.cpu_requests_low_perc_state_alerting_enabled
  critical_threshold = var.cpu_requests_low_perc_state_critical
  warning_threshold  = var.cpu_requests_low_perc_state_warning
  priority           = min(var.cpu_requests_low_perc_state_priority + var.priority_offset, 5)
  docs               = var.cpu_requests_low_perc_state_docs
  note               = var.cpu_requests_low_perc_state_note

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
