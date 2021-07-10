variable "datadog_agent_enabled" {
  type    = bool
  default = true
}

variable "datadog_agent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "datadog_agent_severity" {
  type    = string
  default = "major"
}

variable "datadog_agent_note" {
  type    = string
  default = ""
}

variable "datadog_agent_docs" {
  type    = string
  default = ""
}

variable "datadog_agent_filter_override" {
  type    = string
  default = ""
}

variable "datadog_agent_alerting_enabled" {
  type    = bool
  default = true
}

variable "datadog_agent_no_data_timeframe" {
  type    = number
  default = null
}

variable "datadog_agent_notify_no_data" {
  type    = bool
  default = false
}

variable "datadog_agent_ok_threshold" {
  type    = number
  default = null
}

variable "datadog_agent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}