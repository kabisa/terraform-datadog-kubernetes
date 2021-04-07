locals {
  pod_ready_filter = coalesce(
    var.pod_ready_filter_override,
    var.filter_str
  )
}

module "pod_ready" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "Pod status not ready"
  query = "min(${var.pod_ready_evaluation_period}):sum:kubernetes_state.pod.count{${local.pod_ready_filter}} by {cluster_name,namespace} - sum:kubernetes_state.pod.ready{${local.pod_ready_filter}} by {cluster_name,namespace} > 0"

  enabled          = var.pod_ready_enabled
  alerting_enabled = var.pod_ready_alerting_enabled

  alert_message    = "Kubernetes Pod {{value}} status not ready in namespace {{namespace}} "
  recovery_message = "Kubernetes Pod status recovered in namespace {{namespace}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.pod_ready_severity
  note            = var.pod_ready_note
  docs            = var.pod_ready_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = 0
  locked             = var.locked
}
