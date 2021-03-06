locals {
  cpu_requests_low_perc_filter = coalesce(
    var.cpu_requests_low_perc_filter_override,
    var.filter_str
  )
}

module "cpu_requests_low_perc" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name             = "Available CPU for requests in percentages Low"
  query            = "max(${var.cpu_requests_low_perc_evaluation_period}):( max:kubernetes.cpu.requests{${local.cpu_requests_low_perc_filter}} by {host,cluster_name} / max:kubernetes.cpu.capacity{${local.cpu_requests_low_perc_filter}} by {host,cluster_name} ) * 100 > ${var.cpu_requests_low_perc_critical}"
  alert_message    = "Kubernetes cluster cpu room for requests / percentage is too low"
  recovery_message = "Kubernetes cluster cpu requests / percentage has recovered"

  # monitor level vars
  enabled            = var.cpu_requests_low_perc_enabled
  alerting_enabled   = var.cpu_requests_low_perc_alerting_enabled
  critical_threshold = var.cpu_requests_low_perc_critical
  warning_threshold  = var.cpu_requests_low_perc_warning
  priority           = var.cpu_requests_low_perc_priority
  docs               = var.cpu_requests_low_perc_docs
  note               = var.cpu_requests_low_perc_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
