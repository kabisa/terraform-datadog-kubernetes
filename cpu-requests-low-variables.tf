variable "cpu_requests_low_enabled" {
  type        = bool
  default     = false
  description = "This monitor is based on absolute values and thus less useful. Prefer setting cpu_requests_low_perc_enabled to true."
}

variable "cpu_requests_low_warning" {
  type    = number
  default = 1
}

variable "cpu_requests_low_critical" {
  type    = number
  default = "0.5"
}

variable "cpu_requests_low_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "cpu_requests_low_note" {
  type    = string
  default = ""
}

variable "cpu_requests_low_docs" {
  type    = string
  default = "If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more of a resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
}

variable "cpu_requests_low_filter_override" {
  type    = string
  default = ""
}

variable "cpu_requests_low_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_requests_low_no_data_timeframe" {
  type    = number
  default = null
}

variable "cpu_requests_low_notify_no_data" {
  type    = bool
  default = false
}

variable "cpu_requests_low_ok_threshold" {
  type    = number
  default = null
}

variable "cpu_requests_low_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}