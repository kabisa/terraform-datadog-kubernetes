locals {
  deployment_multiple_restarts_filter = coalesce(
    var.deployment_multiple_restarts_filter_override,
    "${var.filter_str}${var.filter_str_concatenation}kube_deployment:*"
  )
}

module "deployment_multiple_restarts" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name  = "Deployment Multiple Restarts"
  query = "max(${var.deployment_multiple_restarts_evaluation_period}):clamp_min(max:kubernetes.containers.restarts{${local.deployment_multiple_restarts_filter}} by {kube_deployment} - hour_before(max:kubernetes.containers.restarts{${local.deployment_multiple_restarts_filter}} by {kube_deployment}), 0) > ${var.deployment_multiple_restarts_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Kubernetes Deployment {{kube_deployment.name}} has more than {{threshold}} ({{value}}) restarts within one hour"
  recovery_message    = "Kubernetes Deployment {{kube_deployment.name}} is now at {{value}} restarts of the last hour"

  # monitor level vars
  enabled              = var.deployment_multiple_restarts_enabled
  alerting_enabled     = var.deployment_multiple_restarts_alerting_enabled
  warning_threshold    = var.deployment_multiple_restarts_warning
  critical_threshold   = var.deployment_multiple_restarts_critical
  priority             = min(var.deployment_multiple_restarts_priority + var.priority_offset, 5)
  docs                 = var.deployment_multiple_restarts_docs
  note                 = var.deployment_multiple_restarts_note
  notification_channel = try(coalesce(var.deployment_multiple_restarts_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
