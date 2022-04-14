locals {
  dns_filter_tags = join(" OR ", var.dns_filter_tags)
  filter_string   = "(${var.filter_str}) AND (${local.dns_filter_tags})"
  cpu_on_dns_pods_high_filter = coalesce(
    var.cpu_on_dns_pods_high_filter_override,
    local.filter_string
  )
}

module "cpu_on_dns_pods_high" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "CPU Usage on DNS pods is high"
  query            = "avg(${var.cpu_on_dns_pods_high_evaluation_period}):avg:docker.cpu.usage{${local.cpu_on_dns_pods_high_filter}} by {cluster_name,host,container_name} > ${var.cpu_on_dns_pods_high_critical}"
  alert_message    = "Kubernetes CPU usage on DNS pods is too high"
  recovery_message = "Kubernetes CPU usage on DNS pods has recovered"

  # monitor level vars
  enabled            = var.cpu_on_dns_pods_high_enabled
  alerting_enabled   = var.cpu_on_dns_pods_high_alerting_enabled
  critical_threshold = var.cpu_on_dns_pods_high_critical
  warning_threshold  = var.cpu_on_dns_pods_high_warning
  priority           = min(var.cpu_on_dns_pods_high_priority + var.priority_offset, 5)
  docs               = var.cpu_on_dns_pods_high_docs
  note               = var.cpu_on_dns_pods_high_note

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
