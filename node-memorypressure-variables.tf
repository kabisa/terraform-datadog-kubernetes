variable "node_memorypressure_enabled" {
  type    = bool
  default = true
}

variable "node_memorypressure_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > node_memorypressure_critical"
}

variable "node_memorypressure_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "node_memorypressure_note" {
  type    = string
  default = ""
}

variable "node_memorypressure_docs" {
  type    = string
  default = "Memory pressure is a resourcing condition indicating that your node is running out of memory. Similar to CPU resourcing, you don’t want to run out of memory. You especially need to watch for this condition because it could mean there’s a memory leak in one of your applications."
}

variable "node_memorypressure_filter_override" {
  type    = string
  default = ""
}

variable "node_memorypressure_alerting_enabled" {
  type    = bool
  default = true
}

variable "node_memorypressure_no_data_timeframe" {
  type    = number
  default = null
}

variable "node_memorypressure_notify_no_data" {
  type    = bool
  default = false
}

variable "node_memorypressure_ok_threshold" {
  type    = number
  default = null
}

variable "node_memorypressure_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
