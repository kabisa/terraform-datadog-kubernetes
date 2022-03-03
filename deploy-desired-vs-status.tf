locals {
  deploy_desired_vs_status_filter = coalesce(
    var.deploy_desired_vs_status_filter_override,
    var.filter_str
  )
}

module "deploy_desired_vs_status" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "Desired pods vs current pods (Deployments)"
  query            = "avg(${var.deploy_desired_vs_status_evaluation_period}):max:kubernetes_state.deployment.replicas_desired{${local.deploy_desired_vs_status_filter}} by {cluster_name,host} - max:kubernetes_state.deployment.replicas{${local.deploy_desired_vs_status_filter}} by {cluster_name,host} > ${var.deploy_desired_vs_status_critical}"
  alert_message    = "Kubernetes is having trouble getting all the pods to start. (Based on replicas number in all the deployments)"
  recovery_message = "All pods described in deployments have started"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.deploy_desired_vs_status_enabled
  alerting_enabled   = var.deploy_desired_vs_status_alerting_enabled
  critical_threshold = var.deploy_desired_vs_status_critical
  warning_threshold  = var.deploy_desired_vs_status_warning
  priority           = var.deploy_desired_vs_status_priority
  docs               = var.deploy_desired_vs_status_docs
  note               = var.deploy_desired_vs_status_note

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
