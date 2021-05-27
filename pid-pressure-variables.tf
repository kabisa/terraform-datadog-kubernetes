variable "pid_pressure_enabled" {
  type    = bool
  default = true
}

variable "pid_pressure_critical" {
  type        = number
  default     = 0
  description = "alert is raised when (desired - running) > pid_pressure_critical"
}

variable "pid_pressure_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "pid_pressure_severity" {
  type    = string
  default = "minor"
}

variable "pid_pressure_note" {
  type    = string
  default = ""
}

variable "pid_pressure_docs" {
  type    = string
  default = "PID pressure is a rare condition where a pod or container spawns too many processes and starves the node of available process IDs. Each node has a limited number of process IDs to distribute amongst running processes; and if it runs out of IDs, no other processes can be started. Kubernetes lets you set PID thresholds for pods to limit their ability to perform runaway process-spawning, and a PID pressure condition means that one or more pods are using up their allocated PIDs and need to be examined."
}

variable "pid_pressure_filter_override" {
  type    = string
  default = ""
}

variable "pid_pressure_alerting_enabled" {
  type    = bool
  default = false
}

variable "pid_pressure_no_data_timeframe" {
  type    = number
  default = null
}

variable "pid_pressure_notify_no_data" {
  type    = bool
  default = false
}

variable "pid_pressure_ok_threshold" {
  type    = number
  default = null
}

variable "pid_pressure_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}