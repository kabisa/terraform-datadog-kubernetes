locals {
  hpa_status_filter = (
    var.hpa_status_filter_override != "" ? var.hpa_status_filter_override : var.filter_str
  )
}

module "hpa_status" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.1"

  name             = "HPA Status not OK"
  query            = "avg(${var.hpa_status_evaluation_period}):avg:kubernetes_state.hpa.condition{${local.hpa_status_filter}} by {hpa,kube_namespace,status,condition} < 1"
  alert_message    = "Kubernetes HPA Status for Node {{node}} is not ok"
  recovery_message = "Kubernetes HPA Status for Node {{node}} has recovered"


  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.hpa_status_enabled
  alerting_enabled   = var.hpa_status_alerting_enabled
  critical_threshold = 1
  # No warning_threshold possible
  priority = var.hpa_status_priority
  docs     = var.hpa_status_docs
  note     = var.hpa_status_note

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
