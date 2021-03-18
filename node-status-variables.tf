variable "node_status_enabled" {
  type    = bool
  default = true
}

variable "node_status_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "node_status_severity" {
  type    = string
  default = "major"
}

variable "node_status_note" {
  type    = string
  default = ""
}

variable "node_status_docs" {
  type    = string
  default = "This cluster state metric provides a high-level overview of a node’s health and whether the scheduler can place pods on that node. It runs checks on the following node conditions\nhttps://kubernetes.io/docs/concepts/architecture/nodes/#condition"
}

variable "node_status_filter_override" {
  type    = string
  default = ""
}

variable "node_status_alerting_enabled" {
  type    = bool
  default = true
}
