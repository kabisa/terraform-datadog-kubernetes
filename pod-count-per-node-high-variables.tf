variable "pod_count_per_node_high_enabled" {
  type    = bool
  default = true
}

variable "pod_count_per_node_high_warning" {
  type    = number
  default = 90.0
}

variable "pod_count_per_node_high_critical" {
  type    = number
  default = 100.0
}

variable "pod_count_per_node_high_warning_recovery" {
  type    = number
  default = null
}

variable "pod_count_per_node_high_critical_recovery" {
  type    = number
  default = null
}

variable "pod_count_per_node_high_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "pod_count_per_node_high_note" {
  type    = string
  default = ""
}

variable "pod_count_per_node_high_docs" {
  type    = string
  default = ""
}

variable "pod_count_per_node_high_filter_override" {
  type    = string
  default = ""
}

variable "pod_count_per_node_high_alerting_enabled" {
  type    = bool
  default = true
}

variable "pod_count_per_node_high_no_data_timeframe" {
  type    = number
  default = null
}

variable "pod_count_per_node_high_notify_no_data" {
  type    = bool
  default = false
}

variable "pod_count_per_node_high_ok_threshold" {
  type    = number
  default = null
}

variable "pod_count_per_node_high_name_prefix" {
  type    = string
  default = ""
}

variable "pod_count_per_node_high_name_suffix" {
  type    = string
  default = ""
}

variable "pod_count_per_node_high_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
