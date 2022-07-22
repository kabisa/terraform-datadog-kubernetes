variable "env" {
  type = string
}

variable "service" {
  type    = string
  default = "Kubernetes"
}

variable "service_display_name" {
  description = "Readable version of service name of what you're monitoring."
  type        = string
  default     = null
}

variable "notification_channel" {
  type        = string
  description = "The @user or @pagerduty parameters that indicate to Datadog where to send the alerts"
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "filter_str" {
  type = string
}

variable "locked" {
  type        = bool
  default     = true
  description = "Makes sure only the creator or admin can modify the monitor."
}

variable "state_metrics_monitoring" {
  type    = bool
  default = true
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}

variable "filter_str_concatenation" {
  description = "If you use an IN expression you need to switch from , to AND"
  default     = ","
}

variable "priority_offset" {
  description = "For non production workloads we can +1 on the priorities"
  default     = 0
}
