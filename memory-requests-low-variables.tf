variable "memory_requests_low_enabled" {
  type    = bool
  default = false
}

variable "memory_requests_low_warning" {
  type    = number
  default = 4000000000 # Divided by 1024 = around 4GiB
}

variable "memory_requests_low_critical" {
  type    = number
  default = 3000000000 # Divided by 1024 = around 3GiB
}

variable "memory_requests_low_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_requests_low_severity" {
  type    = string
  default = "minor"
}

variable "memory_requests_low_note" {
  type    = string
  default = ""
}

variable "memory_requests_low_docs" {
  type    = string
  default = "Based on usage this might be expected behaviour. In Kubernetes however it is a common practice to over provision resources by setting higher limits. If everything has already been allocated by requests, no hardware resources will be left to over provision with."
}

variable "memory_requests_low_filter_override" {
  type    = string
  default = ""
}

variable "memory_requests_low_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_requests_low_no_data_timeframe" {
  type    = number
  default = null
}

variable "memory_requests_low_notify_no_data" {
  type    = bool
  default = false
}

variable "memory_requests_low_ok_threshold" {
  type    = number
  default = null
}

variable "memory_requests_low_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}