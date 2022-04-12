locals {
  daemonset_multiple_restarts_filter = coalesce(
    var.daemonset_multiple_restarts_filter_override,
    "${var.filter_str}${var.filter_str_concatenation}kube_daemon_set:*"
  )
}

module "daemonset_multiple_restarts" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name  = "Daemonset Multiple Restarts"
  query = "max(${var.daemonset_multiple_restarts_evaluation_period}):clamp_min(max:kubernetes.containers.restarts{${local.daemonset_multiple_restarts_filter}} by {kube_daemon_set} - hour_before(max:kubernetes.containers.restarts{${local.daemonset_multiple_restarts_filter}} by {kube_daemon_set}), 0) > ${var.daemonset_multiple_restarts_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Kubernetes Daemonset {{kube_daemon_set.name}} has more than {{threshold}} ({{value}}) restarts within one hour"
  recovery_message    = "Kubernetes Daemonset {{kube_daemon_set.name}} is now at {{value}} restarts of the last hour"

  # monitor level vars
  enabled              = var.daemonset_multiple_restarts_enabled
  alerting_enabled     = var.daemonset_multiple_restarts_alerting_enabled
  warning_threshold    = var.daemonset_multiple_restarts_warning
  critical_threshold   = var.daemonset_multiple_restarts_critical
  priority             = min(var.daemonset_multiple_restarts_priority + var.priority_offset, 5)
  docs                 = var.daemonset_multiple_restarts_docs
  note                 = var.daemonset_multiple_restarts_note
  notification_channel = try(coalesce(var.daemonset_multiple_restarts_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
