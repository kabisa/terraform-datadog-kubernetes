variable "memory_limits_low_perc_enabled" {
  type    = bool
  default = true
}

variable "memory_limits_low_perc_warning" {
  type    = number
  default = 85
}

variable "memory_limits_low_perc_critical" {
  type    = number
  default = 95
}

variable "memory_limits_low_perc_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_limits_low_perc_severity" {
  type    = string
  default = "minor"
}

variable "memory_limits_low_perc_note" {
  type    = string
  default = ""
}

variable "memory_limits_low_perc_docs" {
  type    = string
  default = "If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
}

variable "memory_limits_low_perc_filter_override" {
  type    = string
  default = ""
}

variable "memory_limits_low_perc_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_limits_low_perc_no_data_timeframe" {
  type    = number
  default = null
}

variable "memory_limits_low_perc_notify_no_data" {
  type    = bool
  default = false
}

variable "memory_limits_low_perc_ok_threshold" {
  type    = number
  default = null
}

variable "memory_limits_low_perc_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}