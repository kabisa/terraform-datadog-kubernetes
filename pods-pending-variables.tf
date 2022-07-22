variable "pods_pending_enabled" {
  type    = bool
  default = true
}

variable "pods_pending_warning" {
  type    = number
  default = null
}

variable "pods_pending_critical" {
  type    = number
  default = 0.0
}

variable "pods_pending_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "pods_pending_note" {
  type    = string
  default = ""
}

variable "pods_pending_docs" {
  type    = string
  default = "https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/"
}

variable "pods_pending_filter_override" {
  type    = string
  default = ""
}

variable "pods_pending_alerting_enabled" {
  type    = bool
  default = true
}

variable "pods_pending_no_data_timeframe" {
  type    = number
  default = null
}

variable "pods_pending_notify_no_data" {
  type    = bool
  default = false
}

variable "pods_pending_ok_threshold" {
  type    = number
  default = null
}

variable "pods_pending_name_prefix" {
  type    = string
  default = ""
}

variable "pods_pending_name_suffix" {
  type    = string
  default = ""
}

variable "pods_pending_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
