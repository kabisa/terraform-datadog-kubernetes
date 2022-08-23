This module mainly check on Kubernetes resource level and cluster health.
System level monitoring can best be implemented with the [system module](https://github.com/kabisa/terraform-datadog-system).
Docker/Container level monitoring can best be implemented with the [docker module](https://github.com/kabisa/terraform-datadog-docker-container).

# Recent changes:

- switch from kubernetes_state to kubernetes_state_core as a default https://docs.datadoghq.com/integrations/kubernetes_state_core/?tab=helm
- upgrade provider to ~> 3.12
