variable "node_memory_used_percent_enabled" {
  type    = bool
  default = true
}

variable "node_memory_used_percent_warning" {
  type    = number
  default = 80
  # 80 %
}

variable "node_memory_used_percent_critical" {
  type    = number
  default = 90
  # 90 %
}

variable "node_memory_used_percent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "node_memory_used_percent_severity" {
  type    = string
  default = "major"
}

variable "node_memory_used_percent_note" {
  type    = string
  default = ""
}

variable "node_memory_used_percent_docs" {
  type    = string
  default = ""
}

variable "node_memory_used_percent_filter_override" {
  type    = string
  default = ""
}

variable "node_memory_used_percent_alerting_enabled" {
  type    = bool
  default = true
}
