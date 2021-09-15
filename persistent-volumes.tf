locals {
  persistent_volumes_filter = coalesce(
    var.persistent_volumes_filter_override,
    var.filter_str
  )
}

module "persistent_volumes_low" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name             = "Failed Persistent Volume Claims"
  query            = "avg(${var.persistent_volumes_evaluation_period}):max:kubernetes_state.persistentvolumes.by_phase{${local.persistent_volumes_filter} AND phase:failed} > ${var.persistent_volumes_critical}"
  alert_message    = "There are failed Physical Volume Claims, storage has problems"
  recovery_message = "There are no failed Physical Volume Claims"

  # monitor level vars
  enabled            = var.persistent_volumes_enabled
  alerting_enabled   = var.persistent_volumes_alerting_enabled
  critical_threshold = var.persistent_volumes_critical
  warning_threshold  = var.persistent_volumes_warning
  priority           = var.persistent_volumes_priority
  docs               = var.persistent_volumes_docs
  note               = var.persistent_volumes_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
