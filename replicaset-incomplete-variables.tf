variable "replicaset_incomplete_enabled" {
  type    = bool
  default = true
}

variable "replicaset_incomplete_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > replicaset_incomplete_critical"
}

variable "replicaset_incomplete_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "replicaset_incomplete_severity" {
  type    = string
  default = "minor"
}

variable "replicaset_incomplete_note" {
  type    = string
  default = "There's also a monitor defined for when the replicaset is completely unavailable"
}

variable "replicaset_incomplete_docs" {
  type    = string
  default = "In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0"
}

variable "replicaset_incomplete_filter_override" {
  type    = string
  default = ""
}

variable "replicaset_incomplete_alerting_enabled" {
  type    = bool
  default = true
}

variable "replicaset_incomplete_no_data_timeframe" {
  type    = number
  default = null
}

variable "replicaset_incomplete_notify_no_data" {
  type    = bool
  default = false
}

variable "replicaset_incomplete_ok_threshold" {
  type    = number
  default = null
}

variable "replicaset_incomplete_name_prefix" {
  type    = string
  default = ""
}

variable "replicaset_incomplete_name_suffix" {
  type    = string
  default = ""
}