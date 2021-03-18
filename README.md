
[//]: # (This file is generated. Do not edit)

# kubernetes

TOC:
<!--ts-->
   * [kubernetes](#kubernetes)
      * [Daemonset Incomplete](#daemonset-incomplete)
      * [Node Status](#node-status)
      * [Replicaset Incomplete](#replicaset-incomplete)
      * [Pod Ready](#pod-ready)
      * [Node Memory Used Percent](#node-memory-used-percent)
      * [Hpa Status](#hpa-status)
      * [Replicaset Unavailable](#replicaset-unavailable)
      * [Module Variables](#module-variables)

<!-- Added by: sjuuljanssen, at: za 13 mrt 2021 15:51:22 CET -->

<!--te-->

## Daemonset Incomplete

| variable                               | default                                  | required | description                                                              |
|----------------------------------------|------------------------------------------|----------|--------------------------------------------------------------------------|
| daemonset_incomplete_enabled           | True                                     | No       |                                                                          |
| daemonset_incomplete_critical          | 0                                        | No       | alert is raised when (desired - running) > daemonset_incomplete_critical |
| daemonset_incomplete_evaluation_period | last_15m                                 | No       |                                                                          |
| daemonset_incomplete_severity          | minor                                    | No       |                                                                          |
| daemonset_incomplete_note              | ""                                       | No       |                                                                          |
| daemonset_incomplete_docs              | In kubernetes a daemonset is responsible for running the same pod across all Nodes. An example for a reason for this not not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0 | No       |                                                                          |
| daemonset_incomplete_filter_override   | ""                                       | No       |                                                                          |
| daemonset_incomplete_alerting_enabled  | True                                     | No       |                                                                          |


## Node Status

| variable                      | default                                  | required | description  |
|-------------------------------|------------------------------------------|----------|--------------|
| node_status_enabled           | True                                     | No       |              |
| node_status_evaluation_period | last_5m                                  | No       |              |
| node_status_severity          | major                                    | No       |              |
| node_status_note              | ""                                       | No       |              |
| node_status_docs              | This cluster state metric provides a high-level overview of a node’s health and whether the scheduler can place pods on that node. It runs checks on the following node conditions\nhttps://kubernetes.io/docs/concepts/architecture/nodes/#condition | No       |              |
| node_status_filter_override   | ""                                       | No       |              |
| node_status_alerting_enabled  | True                                     | No       |              |


## Replicaset Incomplete

| variable                                | default                                  | required | description                                                               |
|-----------------------------------------|------------------------------------------|----------|---------------------------------------------------------------------------|
| replicaset_incomplete_enabled           | True                                     | No       |                                                                           |
| replicaset_incomplete_critical          | 0                                        | No       | alert is raised when (desired - running) > replicaset_incomplete_critical |
| replicaset_incomplete_evaluation_period | last_15m                                 | No       |                                                                           |
| replicaset_incomplete_severity          | minor                                    | No       |                                                                           |
| replicaset_incomplete_note              | There's also a monitor defined for when the replicaset is completely unavailable | No       |                                                                           |
| replicaset_incomplete_docs              | In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0 | No       |                                                                           |
| replicaset_incomplete_filter_override   | ""                                       | No       |                                                                           |
| replicaset_incomplete_alerting_enabled  | True                                     | No       |                                                                           |


## Pod Ready

| variable                    | default                                  | required | description  |
|-----------------------------|------------------------------------------|----------|--------------|
| pod_ready_enabled           | True                                     | No       |              |
| pod_ready_evaluation_period | last_30m                                 | No       |              |
| pod_ready_severity          | minor                                    | No       |              |
| pod_ready_note              | ""                                       | No       |              |
| pod_ready_docs              | A pod may be running but not available, meaning it is not ready and able to accept traffic. This is normal during certain circumstances, such as when a pod is newly launched or when a change is made and deployed to the specification of that pod. But if you see spikes in the number of unavailable pods, or pods that are consistently unavailable, it might indicate a problem with their configuration.\nhttps://www.datadoghq.com/blog/monitoring-kubernetes-performance-metrics/ | No       |              |
| pod_ready_filter_override   | ""                                       | No       |              |
| pod_ready_alerting_enabled  | True                                     | No       |              |


## Node Memory Used Percent

| variable                                   | default  | required | description  |
|--------------------------------------------|----------|----------|--------------|
| node_memory_used_percent_enabled           | True     | No       |              |
| node_memory_used_percent_warning           | 80       | No       |              |
| node_memory_used_percent_critical          | 90       | No       |              |
| node_memory_used_percent_evaluation_period | last_5m  | No       |              |
| node_memory_used_percent_severity          | major    | No       |              |
| node_memory_used_percent_note              | ""       | No       |              |
| node_memory_used_percent_docs              | ""       | No       |              |
| node_memory_used_percent_filter_override   | ""       | No       |              |
| node_memory_used_percent_alerting_enabled  | True     | No       |              |


## Hpa Status

| variable                     | default                                  | required | description  |
|------------------------------|------------------------------------------|----------|--------------|
| hpa_status_enabled           | True                                     | No       |              |
| hpa_status_evaluation_period | last_15m                                 | No       |              |
| hpa_status_severity          | minor                                    | No       |              |
| hpa_status_note              | ""                                       | No       |              |
| hpa_status_docs              | The Horizontal Pod Autoscaler automatically scales the number of Pods in a replication controller, deployment, replica set or stateful set based on observed CPU utilization\nWhen the HPA is unavailable, the situation could arise that not enough resources are provisioned to handle the incoming load\nhttps://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/ | No       |              |
| hpa_status_filter_override   | ""                                       | No       |              |
| hpa_status_alerting_enabled  | True                                     | No       |              |


## Replicaset Unavailable

| variable                                 | default                                  | required | description                                   |
|------------------------------------------|------------------------------------------|----------|-----------------------------------------------|
| replicaset_unavailable_enabled           | True                                     | No       |                                               |
| replicaset_unavailable_critical          | 0                                        | No       | alert is raised when (desired - running) == 0 |
| replicaset_unavailable_evaluation_period | last_5m                                  | No       |                                               |
| replicaset_unavailable_severity          | major                                    | No       |                                               |
| replicaset_unavailable_note              | There's also a monitor defined for when the replicaset is only partially available | No       |                                               |
| replicaset_unavailable_docs              | In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when running == 0 and desired > 0 | No       |                                               |
| replicaset_unavailable_filter_override   | ""                                       | No       |                                               |
| replicaset_unavailable_alerting_enabled  | True                                     | No       |                                               |


## Module Variables

| variable             | default                              | required | description  |
|----------------------|--------------------------------------|----------|--------------|
| env                  |                                      | Yes      |              |
| alert_env            |                                      | Yes      |              |
| service              | Kubernetes                           | No       |              |
| alert_service        | k8s                                  | No       |              |
| notification_channel |                                      | Yes      |              |
| additional_tags      | ['group:TME_IMS_Middleware_Systems'] | No       |              |
| filter_str           |                                      | Yes      |              |


