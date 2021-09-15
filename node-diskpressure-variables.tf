variable "node_diskpressure_enabled" {
  type    = bool
  default = true
}

variable "node_diskpressure_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > node_diskpressure_critical"
}

variable "node_diskpressure_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "node_diskpressure_note" {
  type    = string
  default = ""
}

variable "node_diskpressure_docs" {
  type    = string
  default = "Disk pressure is a condition indicating that a node is using too much disk space or is using disk space too fast, according to the thresholds you have set in your Kubernetes configuration. This is important to monitor because it might mean that you need to add more disk space, if your application legitimately needs more space. Or it might mean that an application is misbehaving and filling up the disk prematurely in an unanticipated manner. Either way, it’s a condition which needs your attention."
}

variable "node_diskpressure_filter_override" {
  type    = string
  default = ""
}

variable "node_diskpressure_alerting_enabled" {
  type    = bool
  default = true
}

variable "node_diskpressure_no_data_timeframe" {
  type    = number
  default = null
}

variable "node_diskpressure_notify_no_data" {
  type    = bool
  default = false
}

variable "node_diskpressure_ok_threshold" {
  type    = number
  default = null
}

variable "node_diskpressure_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}