variable "persistent_volumes_enabled" {
  type    = bool
  default = true
}

variable "persistent_volumes_warning" {
  type    = number
  default = 0
}

variable "persistent_volumes_critical" {
  type    = number
  default = 1
}

variable "persistent_volumes_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "persistent_volumes_note" {
  type    = string
  default = ""
}

variable "persistent_volumes_docs" {
  type    = string
  default = ""
}

variable "persistent_volumes_filter_override" {
  type    = string
  default = ""
}

variable "persistent_volumes_alerting_enabled" {
  type    = bool
  default = true
}

variable "persistent_volumes_no_data_timeframe" {
  type    = number
  default = null
}

variable "persistent_volumes_notify_no_data" {
  type    = bool
  default = false
}

variable "persistent_volumes_ok_threshold" {
  type    = number
  default = null
}

variable "persistent_volumes_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}