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
  default = ["group:TME_IMS_Middleware_Systems", "service:k8s"]
}

variable "filter_str" {
  type = string
}

variable "locked" {
  type    = bool
  default = true
}