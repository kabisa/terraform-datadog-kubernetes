variable "daemonset_multiple_restarts_enabled" {
  type    = bool
  default = true
}

variable "daemonset_multiple_restarts_warning" {
  type    = number
  default = null
}

variable "daemonset_multiple_restarts_critical" {
  type    = number
  default = 5.0
}

variable "daemonset_multiple_restarts_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "daemonset_multiple_restarts_note" {
  type    = string
  default = ""
}

variable "daemonset_multiple_restarts_docs" {
  type    = string
  default = "If a container restarts once, it can be considered 'normal behaviour' for K8s. A Daemonset restarting multiple times though is a problem"
}

variable "daemonset_multiple_restarts_filter_override" {
  type    = string
  default = ""
}

variable "daemonset_multiple_restarts_alerting_enabled" {
  type    = bool
  default = true
}

variable "daemonset_multiple_restarts_no_data_timeframe" {
  type    = number
  default = null
}

variable "daemonset_multiple_restarts_notify_no_data" {
  type    = bool
  default = false
}

variable "daemonset_multiple_restarts_ok_threshold" {
  type    = number
  default = null
}

variable "daemonset_multiple_restarts_name_prefix" {
  type    = string
  default = ""
}

variable "daemonset_multiple_restarts_name_suffix" {
  type    = string
  default = ""
}

variable "daemonset_multiple_restarts_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "daemonset_multiple_restarts_notification_channel_override" {
  type    = string
  default = ""
}
