module "kubernetes" {
  source = "kabisa/kubernetes/datadog"

  notification_channel = "mail@example.com"
  service              = "Kubernetes"
  env                  = "prd"
  alert_env            = "prd"
  filter_str           = "cluster_name:production"
}