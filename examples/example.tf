# tflint-ignore: terraform_module_version
module "kubernetes" {
  source = "kabisa/kubernetes/datadog"

  notification_channel = "mail@example.com"
  service              = "Kubernetes"
  env                  = "prd"
  filter_str           = "kube_cluster_name:production"
}
