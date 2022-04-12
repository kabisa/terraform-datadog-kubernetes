locals {
  replicaset_unavailable_filter = coalesce(
    var.replicaset_unavailable_filter_override,
    var.filter_str
  )
  rs_pods_ready   = "min:kubernetes_state.replicaset.replicas_ready{${local.replicaset_unavailable_filter}} by {kube_replica_set,cluster_name}"
  rs_pods_desired = "min:kubernetes_state.replicaset.replicas_desired{${local.replicaset_unavailable_filter}} by {kube_replica_set,cluster_name}"
}

module "replicaset_unavailable" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name = "Replicaset Unavailable"
  # This (ab)uses a division by zero to make sure we don't get alerts when nr of desired pods < 2
  query            = "max(${var.replicaset_unavailable_evaluation_period}):( ${local.rs_pods_ready} ) / ${local.rs_pods_desired} / ( ${local.rs_pods_desired} - 1 ) <= 0"
  alert_message    = "Kubernetes Replicaset {{kube_replica_set}} is unavailable"
  recovery_message = "Kubernetes Replicaset {{kube_replica_set}} now has available pods"

  # monitor level vars
  enabled            = var.state_metrics_monitoring && var.replicaset_unavailable_enabled
  alerting_enabled   = var.replicaset_unavailable_alerting_enabled
  critical_threshold = 0
  # No warning threshold for this monitor
  priority = min(var.replicaset_unavailable_priority + var.priority_offset, 5)
  docs     = var.replicaset_unavailable_docs
  note     = var.replicaset_unavailable_note

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
