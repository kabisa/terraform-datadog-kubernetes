variable "cpu_on_dns_pods_high_enabled" {
  type    = bool
  default = true
}

variable "cpu_on_dns_pods_high_warning" {
  type    = number
  default = 70
}

variable "cpu_on_dns_pods_high_critical" {
  type    = number
  default = 85
}

variable "cpu_on_dns_pods_high_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "cpu_on_dns_pods_high_severity" {
  type    = string
  default = "major"
}

variable "cpu_on_dns_pods_high_note" {
  type    = string
  default = ""
}

variable "cpu_on_dns_pods_high_docs" {
  type    = string
  default = ""
}

variable "cpu_on_dns_pods_high_filter_override" {
  type    = string
  default = "kube_service:kube-dns OR short_image:coredns OR short_image:ucp-coredns OR short_image:ucp-kube-dns"
}

variable "cpu_on_dns_pods_high_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_on_dns_pods_high_no_data_timeframe" {
  type    = number
  default = null
}

variable "cpu_on_dns_pods_high_notify_no_data" {
  type    = bool
  default = false
}

variable "cpu_on_dns_pods_high_ok_threshold" {
  type    = number
  default = null
}

variable "cpu_on_dns_pods_high_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}