locals {
  datadog_agent_filter = coalesce(
    var.datadog_agent_filter_override,
    var.filter_str
  )
}

module "datadog_agent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0.rc1"

  name             = "Datadog agent not running"
  query            = "avg(${var.datadog_agent_evaluation_period}):avg:datadog.agent.running{${local.datadog_agent_filter}} by {host,cluster_name} < 1"
  alert_message    = "Datadog Agent not running on {{host.name}} in Cluster: {{cluster_name.name}}"
  recovery_message = "Agent running again"

  # monitor level vars
  enabled            = var.datadog_agent_enabled
  alerting_enabled   = var.datadog_agent_alerting_enabled
  critical_threshold = 1
  # no warning threshold for this monitor
  priority = var.datadog_agent_priority
  docs     = var.datadog_agent_docs
  note     = var.datadog_agent_note

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
