locals {
  pod_ready_filter = coalesce(
    var.pod_ready_filter_override,
    var.filter_str
  )
}

module "pod_ready" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name             = "Pod status not ready"
  query            = "min(${var.pod_ready_evaluation_period}):sum:kubernetes_state.pod.count{${local.pod_ready_filter}} by {cluster_name,namespace} - sum:kubernetes_state.pod.ready{${local.pod_ready_filter}} by {cluster_name,namespace} > 0"
  alert_message    = "Kubernetes Pod {{value}} status not ready in namespace {{namespace}} "
  recovery_message = "Kubernetes Pod status recovered in namespace {{namespace}}"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.pod_ready_enabled
  alerting_enabled   = var.pod_ready_alerting_enabled
  critical_threshold = 0
  # No warning possible for status that is either 0 or 1
  priority = var.pod_ready_priority
  docs     = var.pod_ready_docs
  note     = var.pod_ready_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
