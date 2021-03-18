variable "pod_ready_enabled" {
  type    = bool
  default = true
}

variable "pod_ready_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "pod_ready_severity" {
  type    = string
  default = "minor"
}

variable "pod_ready_note" {
  type    = string
  default = ""
}

variable "pod_ready_docs" {
  type    = string
  default = "A pod may be running but not available, meaning it is not ready and able to accept traffic. This is normal during certain circumstances, such as when a pod is newly launched or when a change is made and deployed to the specification of that pod. But if you see spikes in the number of unavailable pods, or pods that are consistently unavailable, it might indicate a problem with their configuration.\nhttps://www.datadoghq.com/blog/monitoring-kubernetes-performance-metrics/"
}

variable "pod_ready_filter_override" {
  type    = string
  default = ""
}

variable "pod_ready_alerting_enabled" {
  type    = bool
  default = true
}
