variable "cpu_limits_low_enabled" {
  type    = bool
  default = true
}

variable "cpu_limits_low_warning" {
  type    = number
  default = 0
}

variable "cpu_limits_low_critical" {
  type    = number
  default = -30
}

variable "cpu_limits_low_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "cpu_limits_low_severity" {
  type    = string
  default = "minor"
}

variable "cpu_limits_low_note" {
  type    = string
  default = ""
}

variable "cpu_limits_low_docs" {
  type    = string
  default = ""
}

variable "cpu_limits_low_filter_override" {
  type    = string
  default = ""
}

variable "cpu_limits_low_alerting_enabled" {
  type    = bool
  default = false
}

variable "cpu_limits_low_no_data_timeframe" {
  type    = number
  default = null
}

variable "cpu_limits_low_notify_no_data" {
  type    = bool
  default = false
}

variable "cpu_limits_low_ok_threshold" {
  type    = number
  default = null
}

variable "cpu_limits_low_name_prefix" {
  type    = string
  default = ""
}

variable "cpu_limits_low_name_suffix" {
  type    = string
  default = ""
}

variable "cpu_limits_low_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}