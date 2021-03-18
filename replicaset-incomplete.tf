locals {
  replicaset_incomplete_filter = coalesce(
    var.replicaset_incomplete_filter_override,
    var.filter_str
  )
}

module "replicaset_incomplete" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.2"

  name  = "Replicaset Incomplete"
  query = "min(${var.replicaset_incomplete_evaluation_period}):max:kubernetes_state.replicaset.replicas_desired{${local.replicaset_incomplete_filter}} by {kube_replica_set,cluster_name} - min:kubernetes_state.replicaset.replicas_ready{${local.replicaset_incomplete_filter}} by {kube_replica_set,cluster_name} > ${var.replicaset_incomplete_critical}"

  enabled          = var.replicaset_incomplete_enabled
  alerting_enabled = var.replicaset_incomplete_alerting_enabled

  alert_message    = "Kubernetes Replicaset {{kube_replica_set}} is incomplete. Missing pod count:{{value}}"
  recovery_message = "Kubernetes Replicaset {{kube_replica_set}} has recovered"

  service         = var.service
  env             = var.alert_env
  severity        = var.replicaset_incomplete_severity
  note            = var.replicaset_incomplete_note
  docs            = var.replicaset_incomplete_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = var.replicaset_incomplete_critical
}
