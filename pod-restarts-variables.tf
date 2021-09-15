variable "pod_restarts_enabled" {
  type    = bool
  default = true
}

variable "pod_restarts_warning" {
  type    = number
  default = 3
}

variable "pod_restarts_critical" {
  type    = number
  default = 5
}

variable "pod_restarts_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "pod_restarts_note" {
  type    = string
  default = ""
}

variable "pod_restarts_docs" {
  type    = string
  default = ""
}

variable "pod_restarts_filter_override" {
  type    = string
  default = ""
}

variable "pod_restarts_alerting_enabled" {
  type    = bool
  default = true
}

variable "pod_restarts_no_data_timeframe" {
  type    = number
  default = null
}

variable "pod_restarts_notify_no_data" {
  type    = bool
  default = false
}

variable "pod_restarts_ok_threshold" {
  type    = number
  default = null
}

variable "pod_restarts_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}