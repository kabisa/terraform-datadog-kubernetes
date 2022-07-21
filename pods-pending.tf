locals {
  pods_pending_filter = coalesce(
    var.pods_pending_filter_override,
    var.filter_str
  )
}

module "pods_pending" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "Pods Pending"
  query = "min(${var.pods_pending_evaluation_period}):default_zero(max:kubernetes_state.pod.status_phase{phase:pending${var.filter_str_concatenation}${local.pods_pending_filter}} by {namespace}) > ${var.pods_pending_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Kubernetes pods pending ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Kubernetes pods pending ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.pods_pending_enabled
  alerting_enabled   = var.pods_pending_alerting_enabled
  warning_threshold  = var.pods_pending_warning
  critical_threshold = var.pods_pending_critical
  priority           = min(var.pods_pending_priority + var.priority_offset, 5)
  docs               = var.pods_pending_docs
  note               = var.pods_pending_note

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
