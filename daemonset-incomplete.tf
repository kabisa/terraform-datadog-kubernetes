locals {
  daemonset_incomplete_filter = coalesce(
    var.daemonset_incomplete_filter_override,
    var.filter_str
  )
}

module "daemonset_incomplete" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "Daemonset Incomplete"
  query            = "min(${var.daemonset_incomplete_evaluation_period}):max:kubernetes_state.daemonset.scheduled{${local.daemonset_incomplete_filter}} by {daemonset,cluster_name} - min:kubernetes_state.daemonset.ready{${local.daemonset_incomplete_filter}} by {daemonset,cluster_name} > 0"
  alert_message    = "Kubernetes Daemonset {{daemonset}} is incomplete. Missing pod count:{{value}}"
  recovery_message = "Kubernetes Daemonset {{daemonset}} has recovered"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.daemonset_incomplete_enabled
  alerting_enabled   = var.daemonset_incomplete_alerting_enabled
  critical_threshold = var.daemonset_incomplete_critical
  # no warning threshold for this monitor
  priority = var.daemonset_incomplete_priority
  severity = var.daemonset_incomplete_severity
  docs     = var.daemonset_incomplete_docs
  note     = var.daemonset_incomplete_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
