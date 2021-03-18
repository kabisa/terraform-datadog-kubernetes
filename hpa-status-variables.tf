variable "hpa_status_enabled" {
  type    = bool
  default = true
}

variable "hpa_status_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "hpa_status_severity" {
  type    = string
  default = "minor"
}

variable "hpa_status_note" {
  type    = string
  default = ""
}

variable "hpa_status_docs" {
  type    = string
  default = "The Horizontal Pod Autoscaler automatically scales the number of Pods in a replication controller, deployment, replica set or stateful set based on observed CPU utilization\nWhen the HPA is unavailable, the situation could arise that not enough resources are provisioned to handle the incoming load\nhttps://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/"
}

variable "hpa_status_filter_override" {
  type    = string
  default = ""
}

variable "hpa_status_alerting_enabled" {
  type    = bool
  default = true
}
