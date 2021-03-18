locals {
  node_memory_used_percent_filter = coalesce(
    var.node_memory_used_percent_filter_override,
    var.filter_str
  )
}

module "node_memory_used_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.2"

  name  = "Memory Used Percent"
  query = "avg(${var.node_memory_used_percent_evaluation_period}):( 100 * max:kubernetes.memory.usage{${local.node_memory_used_percent_filter}} by {host,cluster_name} ) / max:kubernetes.memory.capacity{${local.node_memory_used_percent_filter}} by {host,cluster_name} > ${var.node_memory_used_percent_critical}"

  enabled          = var.node_memory_used_percent_enabled
  alerting_enabled = var.node_memory_used_percent_alerting_enabled

  alert_message    = "Available memory on ${var.service} Node {{host.name}} has dropped below {{threshold}} and has {{value}}% available"
  recovery_message = "Available memory on ${var.service} Node {{host.name}} has recovered {{value}}%"

  service         = var.service
  env             = var.alert_env
  severity        = var.node_memory_used_percent_severity
  note            = var.node_memory_used_percent_note
  docs            = var.node_memory_used_percent_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = var.node_memory_used_percent_critical
  warning_threshold  = var.node_memory_used_percent_warning
}
