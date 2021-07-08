locals {
  dns_filter_tags = join(" OR ", var.dns_filter_tags)
  filter_string   = "(${var.filter_str}) AND (${local.dns_filter_tags})"
  cpu_on_dns_pods_high_filter = coalesce(
    var.cpu_on_dns_pods_high_filter_override,
    local.filter_string
  )
}

module "cpu_on_dns_pods_high" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "CPU Usage on DNS pods is high"
  query            = "avg(${var.cpu_on_dns_pods_high_evaluation_period}):avg:docker.cpu.usage{${local.cpu_on_dns_pods_high_filter}} by {cluster_name,host,container_name} > ${var.cpu_on_dns_pods_high_critical}"
  alert_message    = "Kubernetes CPU usage on DNS pods is too high"
  recovery_message = "Kubernetes CPU usage on DNS pods has recovered"

  # monitor level vars
  enabled            = var.cpu_on_dns_pods_high_enabled
  alerting_enabled   = var.cpu_on_dns_pods_high_alerting_enabled
  critical_threshold = var.cpu_on_dns_pods_high_critical
  warning_threshold  = var.cpu_on_dns_pods_high_warning
  priority           = var.cpu_on_dns_pods_high_priority
  severity           = var.cpu_on_dns_pods_high_severity
  docs               = var.cpu_on_dns_pods_high_docs
  note               = var.cpu_on_dns_pods_high_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
