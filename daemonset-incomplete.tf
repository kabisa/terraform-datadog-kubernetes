locals {
  daemonset_incomplete_filter = coalesce(
    var.daemonset_incomplete_filter_override,
    var.filter_str
  )
}

module "daemonset_incomplete" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Daemonset Incomplete"
  query = "min(${var.daemonset_incomplete_evaluation_period}):max:kubernetes_state.daemonset.scheduled{${local.daemonset_incomplete_filter}} by {daemonset,cluster_name} - min:kubernetes_state.daemonset.ready{${local.daemonset_incomplete_filter}} by {daemonset,cluster_name} > 0"

  enabled          = var.daemonset_incomplete_enabled
  alerting_enabled = var.daemonset_incomplete_alerting_enabled

  alert_message    = "Kubernetes Daemonset {{daemonset}} is incomplete. Missing pod count:{{value}}"
  recovery_message = "Kubernetes Daemonset {{daemonset}} has recovered"

  service         = var.service
  env             = var.alert_env
  severity        = var.daemonset_incomplete_severity
  note            = var.daemonset_incomplete_note
  docs            = var.daemonset_incomplete_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = var.daemonset_incomplete_critical
  locked             = var.locked
}
