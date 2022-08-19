variable "daemonset_incomplete_enabled" {
  type    = bool
  default = true
}

variable "daemonset_incomplete_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > daemonset_incomplete_critical"
}

variable "daemonset_incomplete_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "daemonset_incomplete_note" {
  type    = string
  default = ""
}

variable "daemonset_incomplete_docs" {
  type    = string
  default = "In kubernetes a daemonset is responsible for running the same pod across all Nodes. An example for when this fails, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0"
}

variable "daemonset_incomplete_filter_override" {
  type    = string
  default = ""
}

variable "daemonset_incomplete_alerting_enabled" {
  type    = bool
  default = true
}

variable "daemonset_incomplete_no_data_timeframe" {
  type    = number
  default = null
}

variable "daemonset_incomplete_notify_no_data" {
  type    = bool
  default = false
}

variable "daemonset_incomplete_ok_threshold" {
  type    = number
  default = null
}

variable "daemonset_incomplete_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
