variable "network_unavailable_enabled" {
  type    = bool
  default = true
}

variable "network_unavailable_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > network_unavailable_critical"
}

variable "network_unavailable_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "network_unavailable_severity" {
  type    = string
  default = "minor"
}

variable "network_unavailable_note" {
  type    = string
  default = ""
}

variable "network_unavailable_docs" {
  type    = string
  default = "All your nodes need network  connections, and this status indicates that there’s something wrong with a node’s network connection. Either it wasn’t set up properly (due to route exhaustion or a misconfiguration), or there’s a physical problem with the network connection to your hardware."
}

variable "network_unavailable_filter_override" {
  type    = string
  default = ""
}

variable "network_unavailable_alerting_enabled" {
  type    = bool
  default = false
}

variable "network_unavailable_no_data_timeframe" {
  type    = number
  default = null
}

variable "network_unavailable_notify_no_data" {
  type    = bool
  default = false
}

variable "network_unavailable_ok_threshold" {
  type    = number
  default = null
}

variable "network_unavailable_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}