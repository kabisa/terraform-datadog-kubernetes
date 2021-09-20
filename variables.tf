variable "env" {
  type = string
}

variable "alert_env" {
  type = string
}

variable "service" {
  type    = string
  default = "Kubernetes"
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