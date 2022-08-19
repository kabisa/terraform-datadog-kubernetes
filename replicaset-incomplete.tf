locals {
  replicaset_incomplete_filter = coalesce(
    var.replicaset_incomplete_filter_override,
    var.filter_str
  )
}

module "replicaset_incomplete" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "Replicaset Incomplete"
  query            = "min(${var.replicaset_incomplete_evaluation_period}):max:kubernetes_state.replicaset.replicas_desired{${local.replicaset_incomplete_filter}} by {kube_replica_set,kube_cluster_name} - min:kubernetes_state.replicaset.replicas_ready{${local.replicaset_incomplete_filter}} by {kube_replica_set,kube_cluster_name} > ${var.replicaset_incomplete_critical}"
  alert_message    = "Kubernetes Replicaset {{kube_replica_set}} is incomplete. Missing pod count:{{value}}"
  recovery_message = "Kubernetes Replicaset {{kube_replica_set}} has recovered"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.replicaset_incomplete_enabled
  alerting_enabled   = var.replicaset_incomplete_alerting_enabled
  critical_threshold = var.replicaset_incomplete_critical
  # No warning threshold for this monitor
  priority = min(var.replicaset_incomplete_priority + var.priority_offset, 5)
  docs     = var.replicaset_incomplete_docs
  note     = var.replicaset_incomplete_note

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
