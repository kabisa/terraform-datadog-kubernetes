locals {
  hpa_status_filter = (
    var.hpa_status_filter_override != ""
    ? var.hpa_status_filter_override
    : var.filter_str
  )
}

module "hpa_status" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "HPA Status not OK"
  query = "avg(${var.hpa_status_evaluation_period}):avg:kubernetes_state.hpa.condition{${local.hpa_status_filter}} by {hpa,kube_namespace,status,condition} < 1"

  enabled          = var.hpa_status_enabled
  alerting_enabled = var.hpa_status_alerting_enabled

  alert_message    = "Kubernetes HPA Status for Node {{node}} is not ok"
  recovery_message = "Kubernetes HPA Status for Node {{node}} has recovered"

  service         = var.service
  env             = var.alert_env
  severity        = var.hpa_status_severity
  note            = var.hpa_status_note
  docs            = var.hpa_status_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false

  critical_threshold = 1
  locked             = var.locked
}
