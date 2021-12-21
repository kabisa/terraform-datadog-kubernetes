locals {
  node_memory_used_percent_filter = coalesce(
    var.node_memory_used_percent_filter_override,
    var.filter_str
  )
}

module "node_memory_used_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "Memory Used Percent"
  query            = "avg(${var.node_memory_used_percent_evaluation_period}):( 100 * max:kubernetes.memory.usage{${local.node_memory_used_percent_filter}} by {host,cluster_name} ) / max:kubernetes.memory.capacity{${local.node_memory_used_percent_filter}} by {host,cluster_name} > ${var.node_memory_used_percent_critical}"
  alert_message    = "Available memory on ${var.service} Node {{host.name}} has dropped below {{threshold}} and has {{value}}% available"
  recovery_message = "Available memory on ${var.service} Node {{host.name}} has recovered {{value}}%"

  # monitor level vars
  enabled            = var.node_memory_used_percent_enabled
  alerting_enabled   = var.node_memory_used_percent_alerting_enabled
  critical_threshold = var.node_memory_used_percent_critical
  warning_threshold  = var.node_memory_used_percent_warning
  priority           = var.node_memory_used_percent_priority
  docs               = var.node_memory_used_percent_docs
  note               = var.node_memory_used_percent_note

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
