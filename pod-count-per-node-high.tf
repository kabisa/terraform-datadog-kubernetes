locals {
  pod_count_per_node_high_filter = coalesce(
    var.pod_count_per_node_high_filter_override,
    var.filter_str
  )
}

module "pod_count_per_node_high" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "Pod count per node high"
  query = "min(${var.pod_count_per_node_high_evaluation_period}):sum:kubernetes.pods.running{${local.pod_count_per_node_high_filter}} by {host} > ${var.pod_count_per_node_high_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Pod count per node high ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Pod count per node high ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.pod_count_per_node_high_enabled
  alerting_enabled   = var.pod_count_per_node_high_alerting_enabled
  critical_threshold = var.pod_count_per_node_high_critical
  critical_recovery  = var.pod_count_per_node_high_critical_recovery
  warning_threshold  = var.pod_count_per_node_high_warning
  warning_recovery   = var.pod_count_per_node_high_warning_recovery
  priority           = min(var.pod_count_per_node_high_priority + var.priority_offset, 5)
  docs               = var.pod_count_per_node_high_docs
  note               = var.pod_count_per_node_high_note

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
