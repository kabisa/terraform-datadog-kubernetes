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
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "filter_str" {
  type = string
}

variable "locked" {
  type    = bool
  default = true
}