variable "node_ready_enabled" {
  type    = bool
  default = true
}

variable "node_ready_critical" {
  type        = number
  default     = 1
}

variable "node_ready_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "node_ready_severity" {
  type    = string
  default = "minor"
}

variable "node_ready_note" {
  type    = string
  default = ""
}

variable "node_ready_docs" {
  type    = string
  default = "Checks to see if the node is in ready status or not"
}

variable "node_ready_filter_override" {
  type    = string
  default = ""
}

variable "node_ready_alerting_enabled" {
  type    = bool
  default = true
}

variable "node_ready_no_data_timeframe" {
  type    = number
  default = null
}

variable "node_ready_notify_no_data" {
  type    = bool
  default = false
}

variable "node_ready_ok_threshold" {
  type    = number
  default = null
}

variable "node_ready_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}