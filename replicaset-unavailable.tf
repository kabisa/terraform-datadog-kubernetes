locals {
  replicaset_unavailable_filter = coalesce(
    var.replicaset_unavailable_filter_override,
    var.filter_str
  )
  rs_pods_ready = "min:kubernetes_state.replicaset.replicas_ready{${local.replicaset_unavailable_filter}} by {kube_replica_set,cluster_name}"
  rs_pods_desired = "min:kubernetes_state.replicaset.replicas_desired{${local.replicaset_unavailable_filter}} by {kube_replica_set,cluster_name}"
}

module "replicaset_unavailable" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name = "Replicaset Unavailable"
  # This (ab)uses a division by zero to
  query = "max(${var.replicaset_unavailable_evaluation_period}):( ${local.rs_pods_ready} ) / ${local.rs_pods_desired} / ( ${local.rs_pods_desired} - 1 ) <= 0"

  enabled          = var.replicaset_unavailable_enabled
  alerting_enabled = var.replicaset_unavailable_alerting_enabled

  alert_message    = "Kubernetes Replicaset {{kube_replica_set}} is unavailable"
  recovery_message = "Kubernetes Replicaset {{kube_replica_set}} now has available pods"

  service         = var.service
  env             = var.alert_env
  severity        = var.replicaset_unavailable_severity
  note            = var.replicaset_unavailable_note
  docs            = var.replicaset_unavailable_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = 0
  locked             = var.locked
}
