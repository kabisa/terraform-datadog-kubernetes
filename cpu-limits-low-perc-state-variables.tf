variable "cpu_limits_low_perc_state_enabled" {
  type        = bool
  default     = false
  description = "CPU state limits are only available when the state metrics api is deployed https://github.com/kubernetes/kube-state-metrics"
}

variable "cpu_limits_low_perc_state_warning" {
  type    = number
  default = 80
}

variable "cpu_limits_low_perc_state_critical" {
  type    = number
  default = 95
}

variable "cpu_limits_low_perc_state_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "cpu_limits_low_perc_state_severity" {
  type    = string
  default = "minor"
}

variable "cpu_limits_low_perc_state_note" {
  type    = string
  default = ""
}

variable "cpu_limits_low_perc_state_docs" {
  type    = string
  default = ""
}

variable "cpu_limits_low_perc_state_filter_override" {
  type    = string
  default = ""
}

variable "cpu_limits_low_perc_state_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_limits_low_perc_state_no_data_timeframe" {
  type    = number
  default = null
}

variable "cpu_limits_low_perc_state_notify_no_data" {
  type    = bool
  default = false
}

variable "cpu_limits_low_perc_state_ok_threshold" {
  type    = number
  default = null
}

variable "cpu_limits_low_perc_state_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}