locals {
  datadog_agent_filter = coalesce(
    var.datadog_agent_filter_override,
    var.filter_str
  )
}

module "datadog_agent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "Node Not Ready"
  query            = "avg(${var.datadog_agent_evaluation_period}):count_nonzero(sum:kubernetes_state.nodes.by_condition{${local.datadog_agent_filter} AND (NOT condition:ready) AND (status:true OR status:unknown)} by {cluster_name,host}) > ${var.datadog_agent_critical}"
  alert_message    = "Datadog Agent not running on {{host.name}} in Cluster: {{cluster_name.name}}"
  recovery_message = "Agent running again"

  # monitor level vars
  enabled            = var.datadog_agent_enabled
  alerting_enabled   = var.datadog_agent_alerting_enabled
  critical_threshold = var.datadog_agent_critical
  # no warning threshold for this monitor
  priority = var.datadog_agent_priority
  severity = var.datadog_agent_severity
  docs     = var.datadog_agent_docs
  note     = var.datadog_agent_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
