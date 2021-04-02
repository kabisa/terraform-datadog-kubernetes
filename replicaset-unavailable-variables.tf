variable "replicaset_unavailable_enabled" {
  type    = bool
  default = true
}

variable "replicaset_unavailable_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) == 0"
}

variable "replicaset_unavailable_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "replicaset_unavailable_severity" {
  type    = string
  default = "major"
}

variable "replicaset_unavailable_note" {
  type    = string
  default = "There's also a monitor defined for when the replicaset is only partially available"
}

variable "replicaset_unavailable_docs" {
  type    = string
  default = "In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when running == 0 and desired > 1"
}

variable "replicaset_unavailable_filter_override" {
  type    = string
  default = ""
}

variable "replicaset_unavailable_alerting_enabled" {
  type    = bool
  default = true
}

variable "replicaset_unavailable_no_data_timeframe" {
  type    = number
  default = null
}

variable "replicaset_unavailable_notify_no_data" {
  type    = bool
  default = false
}

variable "replicaset_unavailable_ok_threshold" {
  type    = number
  default = null
}

variable "replicaset_unavailable_name_prefix" {
  type    = string
  default = ""
}

variable "replicaset_unavailable_name_suffix" {
  type    = string
  default = ""
}