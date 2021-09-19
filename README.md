
# Getting started
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in the repo.
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.


[//]: # (This file is generated. Do not edit)


# Terraform module for Datadog Kubernetes

TOC:
<!--ts-->
   * [Getting started](#getting-started)
   * [Terraform module for Datadog Kubernetes](#terraform-module-for-datadog-kubernetes)
      * [Daemonset Incomplete](#daemonset-incomplete)
      * [Node Status](#node-status)
      * [Replicaset Incomplete](#replicaset-incomplete)
      * [Pod Ready](#pod-ready)
      * [Node Memorypressure](#node-memorypressure)
      * [Network Unavailable](#network-unavailable)
      * [Deploy Desired Vs Status](#deploy-desired-vs-status)
      * [Node Memory Used Percent](#node-memory-used-percent)
      * [Hpa Status](#hpa-status)
      * [CPU Requests Low](#cpu-requests-low)
      * [Replicaset Unavailable](#replicaset-unavailable)
      * [Memory Limits Low](#memory-limits-low)
      * [Pid Pressure](#pid-pressure)
      * [Persistent Volumes](#persistent-volumes)
      * [CPU Limits Low](#cpu-limits-low)
      * [CPU On Dns Pods High](#cpu-on-dns-pods-high)
      * [Node Diskpressure](#node-diskpressure)
      * [Memory Requests Low](#memory-requests-low)
      * [Module Variables](#module-variables)

<!-- Added by: sjuuljanssen, at: di 22 jun 2021 10:30:15 CEST -->

<!--te-->

## Daemonset Incomplete

| variable                               | default                                  | required | description                                                              |
|----------------------------------------|------------------------------------------|----------|--------------------------------------------------------------------------|
| daemonset_incomplete_enabled           | True                                     | No       |                                                                          |
| daemonset_incomplete_critical          | 0                                        | No       | alert is raised when (desired - running) > daemonset_incomplete_critical |
| daemonset_incomplete_evaluation_period | last_30m                                 | No       |                                                                          |
| daemonset_incomplete_severity          | minor                                    | No       |                                                                          |
| daemonset_incomplete_note              | ""                                       | No       |                                                                          |
| daemonset_incomplete_docs              | In kubernetes a daemonset is responsible for running the same pod across all Nodes. An example for a reason for this not not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0 | No       |                                                                          |
| daemonset_incomplete_filter_override   | ""                                       | No       |                                                                          |
| daemonset_incomplete_alerting_enabled  | True                                     | No       |                                                                          |
| daemonset_incomplete_no_data_timeframe | null                                     | No       |                                                                          |
| daemonset_incomplete_notify_no_data    | False                                    | No       |                                                                          |
| daemonset_incomplete_ok_threshold      | null                                     | No       |                                                                          |
| daemonset_incomplete_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                         |


## Node Status

| variable                      | default                                  | required | description                      |
|-------------------------------|------------------------------------------|----------|----------------------------------|
| node_status_enabled           | True                                     | No       |                                  |
| node_status_evaluation_period | last_5m                                  | No       |                                  |
| node_status_severity          | major                                    | No       |                                  |
| node_status_note              | ""                                       | No       |                                  |
| node_status_docs              | This cluster state metric provides a high-level overview of a node’s health and whether the scheduler can place pods on that node. It runs checks on the following node conditions\nhttps://kubernetes.io/docs/concepts/architecture/nodes/#condition | No       |                                  |
| node_status_filter_override   | ""                                       | No       |                                  |
| node_status_alerting_enabled  | True                                     | No       |                                  |
| node_status_no_data_timeframe | null                                     | No       |                                  |
| node_status_notify_no_data    | False                                    | No       |                                  |
| node_status_ok_threshold      | null                                     | No       |                                  |
| node_status_priority          | 2                                        | No       | Number from 1 (high) to 5 (low). |


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
| replicaset_incomplete_no_data_timeframe | null                                     | No       |                                                                           |
| replicaset_incomplete_notify_no_data    | False                                    | No       |                                                                           |
| replicaset_incomplete_ok_threshold      | null                                     | No       |                                                                           |
| replicaset_incomplete_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                          |


## Pod Ready

| variable                    | default                                  | required | description                      |
|-----------------------------|------------------------------------------|----------|----------------------------------|
| pod_ready_enabled           | True                                     | No       |                                  |
| pod_ready_evaluation_period | last_30m                                 | No       |                                  |
| pod_ready_severity          | minor                                    | No       |                                  |
| pod_ready_note              | ""                                       | No       |                                  |
| pod_ready_docs              | A pod may be running but not available, meaning it is not ready and able to accept traffic. This is normal during certain circumstances, such as when a pod is newly launched or when a change is made and deployed to the specification of that pod. But if you see spikes in the number of unavailable pods, or pods that are consistently unavailable, it might indicate a problem with their configuration.\nhttps://www.datadoghq.com/blog/monitoring-kubernetes-performance-metrics/ | No       |                                  |
| pod_ready_filter_override   | ""                                       | No       |                                  |
| pod_ready_alerting_enabled  | True                                     | No       |                                  |
| pod_ready_no_data_timeframe | null                                     | No       |                                  |
| pod_ready_notify_no_data    | False                                    | No       |                                  |
| pod_ready_ok_threshold      | null                                     | No       |                                  |
| pod_ready_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Node Memorypressure

| variable                              | default                                  | required | description                                                             |
|---------------------------------------|------------------------------------------|----------|-------------------------------------------------------------------------|
| node_memorypressure_enabled           | True                                     | No       |                                                                         |
| node_memorypressure_critical          | 0                                        | No       | alert is raised when (desired - running) > node_memorypressure_critical |
| node_memorypressure_evaluation_period | last_5m                                  | No       |                                                                         |
| node_memorypressure_severity          | minor                                    | No       |                                                                         |
| node_memorypressure_note              | ""                                       | No       |                                                                         |
| node_memorypressure_docs              | Memory pressure is a resourcing condition indicating that your node is running out of memory. Similar to CPU resourcing, you don’t want to run out of memory. You especially need to watch for this condition because it could mean there’s a memory leak in one of your applications. | No       |                                                                         |
| node_memorypressure_filter_override   | ""                                       | No       |                                                                         |
| node_memorypressure_alerting_enabled  | True                                     | No       |                                                                         |
| node_memorypressure_no_data_timeframe | null                                     | No       |                                                                         |
| node_memorypressure_notify_no_data    | False                                    | No       |                                                                         |
| node_memorypressure_ok_threshold      | null                                     | No       |                                                                         |
| node_memorypressure_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                        |


## Network Unavailable

| variable                              | default                                  | required | description                                                             |
|---------------------------------------|------------------------------------------|----------|-------------------------------------------------------------------------|
| network_unavailable_enabled           | True                                     | No       |                                                                         |
| network_unavailable_critical          | 0                                        | No       | alert is raised when (desired - running) > network_unavailable_critical |
| network_unavailable_evaluation_period | last_5m                                  | No       |                                                                         |
| network_unavailable_severity          | minor                                    | No       |                                                                         |
| network_unavailable_note              | ""                                       | No       |                                                                         |
| network_unavailable_docs              | All your nodes need network  connections, and this status indicates that there’s something wrong with a node’s network connection. Either it wasn’t set up properly (due to route exhaustion or a misconfiguration), or there’s a physical problem with the network connection to your hardware. | No       |                                                                         |
| network_unavailable_filter_override   | ""                                       | No       |                                                                         |
| network_unavailable_alerting_enabled  | True                                     | No       |                                                                         |
| network_unavailable_no_data_timeframe | null                                     | No       |                                                                         |
| network_unavailable_notify_no_data    | False                                    | No       |                                                                         |
| network_unavailable_ok_threshold      | null                                     | No       |                                                                         |
| network_unavailable_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                        |


## Deploy Desired Vs Status

| variable                                   | default                                  | required | description                      |
|--------------------------------------------|------------------------------------------|----------|----------------------------------|
| deploy_desired_vs_status_enabled           | True                                     | No       |                                  |
| deploy_desired_vs_status_warning           | 1                                        | No       |                                  |
| deploy_desired_vs_status_critical          | 10                                       | No       |                                  |
| deploy_desired_vs_status_evaluation_period | last_15m                                 | No       |                                  |
| deploy_desired_vs_status_severity          | minor                                    | No       |                                  |
| deploy_desired_vs_status_note              | ""                                       | No       |                                  |
| deploy_desired_vs_status_docs              | The amount of expected pods to run minus the actual number | No       |                                  |
| deploy_desired_vs_status_filter_override   | ""                                       | No       |                                  |
| deploy_desired_vs_status_alerting_enabled  | True                                     | No       |                                  |
| deploy_desired_vs_status_no_data_timeframe | null                                     | No       |                                  |
| deploy_desired_vs_status_notify_no_data    | False                                    | No       |                                  |
| deploy_desired_vs_status_ok_threshold      | null                                     | No       |                                  |
| deploy_desired_vs_status_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Node Memory Used Percent

| variable                                   | default  | required | description                      |
|--------------------------------------------|----------|----------|----------------------------------|
| node_memory_used_percent_enabled           | True     | No       |                                  |
| node_memory_used_percent_warning           | 80       | No       |                                  |
| node_memory_used_percent_critical          | 90       | No       |                                  |
| node_memory_used_percent_evaluation_period | last_5m  | No       |                                  |
| node_memory_used_percent_severity          | major    | No       |                                  |
| node_memory_used_percent_note              | ""       | No       |                                  |
| node_memory_used_percent_docs              | ""       | No       |                                  |
| node_memory_used_percent_filter_override   | ""       | No       |                                  |
| node_memory_used_percent_alerting_enabled  | True     | No       |                                  |
| node_memory_used_percent_no_data_timeframe | null     | No       |                                  |
| node_memory_used_percent_notify_no_data    | False    | No       |                                  |
| node_memory_used_percent_ok_threshold      | null     | No       |                                  |
| node_memory_used_percent_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Hpa Status

| variable                     | default                                  | required | description                      |
|------------------------------|------------------------------------------|----------|----------------------------------|
| hpa_status_enabled           | True                                     | No       |                                  |
| hpa_status_evaluation_period | last_15m                                 | No       |                                  |
| hpa_status_severity          | minor                                    | No       |                                  |
| hpa_status_note              | ""                                       | No       |                                  |
| hpa_status_docs              | The Horizontal Pod Autoscaler automatically scales the number of Pods in a replication controller, deployment, replica set or stateful set based on observed CPU utilization\nWhen the HPA is unavailable, the situation could arise that not enough resources are provisioned to handle the incoming load\nhttps://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/ | No       |                                  |
| hpa_status_filter_override   | ""                                       | No       |                                  |
| hpa_status_alerting_enabled  | True                                     | No       |                                  |
| hpa_status_no_data_timeframe | null                                     | No       |                                  |
| hpa_status_notify_no_data    | False                                    | No       |                                  |
| hpa_status_ok_threshold      | null                                     | No       |                                  |
| hpa_status_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## CPU Requests Low

| variable                           | default  | required | description                      |
|------------------------------------|----------|----------|----------------------------------|
| cpu_requests_low_enabled           | True     | No       |                                  |
| cpu_requests_low_warning           | 1        | No       |                                  |
| cpu_requests_low_critical          | 0.5      | No       |                                  |
| cpu_requests_low_evaluation_period | last_5m  | No       |                                  |
| cpu_requests_low_severity          | warning  | No       |                                  |
| cpu_requests_low_note              | ""       | No       |                                  |
| cpu_requests_low_docs              | ""       | No       |                                  |
| cpu_requests_low_filter_override   | ""       | No       |                                  |
| cpu_requests_low_alerting_enabled  | True     | No       |                                  |
| cpu_requests_low_no_data_timeframe | null     | No       |                                  |
| cpu_requests_low_notify_no_data    | False    | No       |                                  |
| cpu_requests_low_ok_threshold      | null     | No       |                                  |
| cpu_requests_low_priority          | 4        | No       | Number from 1 (high) to 5 (low). |


## Replicaset Unavailable

| variable                                 | default                                  | required | description                                   |
|------------------------------------------|------------------------------------------|----------|-----------------------------------------------|
| replicaset_unavailable_enabled           | True                                     | No       |                                               |
| replicaset_unavailable_critical          | 0                                        | No       | alert is raised when (desired - running) == 0 |
| replicaset_unavailable_evaluation_period | last_5m                                  | No       |                                               |
| replicaset_unavailable_severity          | major                                    | No       |                                               |
| replicaset_unavailable_note              | There's also a monitor defined for when the replicaset is only partially available | No       |                                               |
| replicaset_unavailable_docs              | In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when running == 0 and desired > 1 | No       |                                               |
| replicaset_unavailable_filter_override   | ""                                       | No       |                                               |
| replicaset_unavailable_alerting_enabled  | True                                     | No       |                                               |
| replicaset_unavailable_no_data_timeframe | null                                     | No       |                                               |
| replicaset_unavailable_notify_no_data    | False                                    | No       |                                               |
| replicaset_unavailable_ok_threshold      | null                                     | No       |                                               |
| replicaset_unavailable_priority          | 2                                        | No       | Number from 1 (high) to 5 (low).              |


## Memory Limits Low

| variable                            | default    | required | description                      |
|-------------------------------------|------------|----------|----------------------------------|
| memory_limits_low_enabled           | True       | No       |                                  |
| memory_limits_low_warning           | 4000000000 | No       |                                  |
| memory_limits_low_critical          | 3000000000 | No       |                                  |
| memory_limits_low_evaluation_period | last_5m    | No       |                                  |
| memory_limits_low_severity          | minor      | No       |                                  |
| memory_limits_low_note              | ""         | No       |                                  |
| memory_limits_low_docs              | ""         | No       |                                  |
| memory_limits_low_filter_override   | ""         | No       |                                  |
| memory_limits_low_alerting_enabled  | True       | No       |                                  |
| memory_limits_low_no_data_timeframe | null       | No       |                                  |
| memory_limits_low_notify_no_data    | False      | No       |                                  |
| memory_limits_low_ok_threshold      | null       | No       |                                  |
| memory_limits_low_priority          | 3          | No       | Number from 1 (high) to 5 (low). |


## Pid Pressure

| variable                       | default                                  | required | description                                                      |
|--------------------------------|------------------------------------------|----------|------------------------------------------------------------------|
| pid_pressure_enabled           | True                                     | No       |                                                                  |
| pid_pressure_critical          | 0                                        | No       | alert is raised when (desired - running) > pid_pressure_critical |
| pid_pressure_evaluation_period | last_5m                                  | No       |                                                                  |
| pid_pressure_severity          | minor                                    | No       |                                                                  |
| pid_pressure_note              | ""                                       | No       |                                                                  |
| pid_pressure_docs              | PID pressure is a rare condition where a pod or container spawns too many processes and starves the node of available process IDs. Each node has a limited number of process IDs to distribute amongst running processes; and if it runs out of IDs, no other processes can be started. Kubernetes lets you set PID thresholds for pods to limit their ability to perform runaway process-spawning, and a PID pressure condition means that one or more pods are using up their allocated PIDs and need to be examined. | No       |                                                                  |
| pid_pressure_filter_override   | ""                                       | No       |                                                                  |
| pid_pressure_alerting_enabled  | True                                     | No       |                                                                  |
| pid_pressure_no_data_timeframe | null                                     | No       |                                                                  |
| pid_pressure_notify_no_data    | False                                    | No       |                                                                  |
| pid_pressure_ok_threshold      | null                                     | No       |                                                                  |
| pid_pressure_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                 |


## Persistent Volumes

| variable                             | default  | required | description                      |
|--------------------------------------|----------|----------|----------------------------------|
| persistent_volumes_enabled           | True     | No       |                                  |
| persistent_volumes_warning           | 0        | No       |                                  |
| persistent_volumes_critical          | 1        | No       |                                  |
| persistent_volumes_evaluation_period | last_5m  | No       |                                  |
| persistent_volumes_severity          | minor    | No       |                                  |
| persistent_volumes_note              | ""       | No       |                                  |
| persistent_volumes_docs              | ""       | No       |                                  |
| persistent_volumes_filter_override   | ""       | No       |                                  |
| persistent_volumes_alerting_enabled  | True     | No       |                                  |
| persistent_volumes_no_data_timeframe | null     | No       |                                  |
| persistent_volumes_notify_no_data    | False    | No       |                                  |
| persistent_volumes_ok_threshold      | null     | No       |                                  |
| persistent_volumes_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## CPU Limits Low

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| cpu_limits_low_enabled           | True     | No       |                                  |
| cpu_limits_low_warning           | 0        | No       |                                  |
| cpu_limits_low_critical          | -30      | No       |                                  |
| cpu_limits_low_evaluation_period | last_5m  | No       |                                  |
| cpu_limits_low_severity          | minor    | No       |                                  |
| cpu_limits_low_note              | ""       | No       |                                  |
| cpu_limits_low_docs              | ""       | No       |                                  |
| cpu_limits_low_filter_override   | ""       | No       |                                  |
| cpu_limits_low_alerting_enabled  | True     | No       |                                  |
| cpu_limits_low_no_data_timeframe | null     | No       |                                  |
| cpu_limits_low_notify_no_data    | False    | No       |                                  |
| cpu_limits_low_ok_threshold      | null     | No       |                                  |
| cpu_limits_low_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## CPU On Dns Pods High

| variable                               | default                                  | required | description                                                                                          |
|----------------------------------------|------------------------------------------|----------|------------------------------------------------------------------------------------------------------|
| cpu_on_dns_pods_high_enabled           | True                                     | No       |                                                                                                      |
| cpu_on_dns_pods_high_warning           | 70                                       | No       |                                                                                                      |
| cpu_on_dns_pods_high_critical          | 85                                       | No       |                                                                                                      |
| cpu_on_dns_pods_high_evaluation_period | last_30m                                 | No       |                                                                                                      |
| cpu_on_dns_pods_high_severity          | major                                    | No       |                                                                                                      |
| cpu_on_dns_pods_high_note              | ""                                       | No       |                                                                                                      |
| cpu_on_dns_pods_high_docs              | ""                                       | No       |                                                                                                      |
| cpu_on_dns_pods_high_filter_override   | ""                                       | No       |                                                                                                      |
| dns_filter_tags                        | ['kube_service:kube-dns', 'short_image:coredns', 'short_image:ucp-coredns', 'short_image:ucp-kube-dns'] | No       | Getting all the DNS containers by default is hard to do.
    What we try is to make a list of datadog tags / filters that should help us find those
    We then build a filter in the following way: ($originalfilterstring) AND (item1 OR item2 OR item3...)
    If that doesn't work for your use-cause you can override the filter list or use cpu_on_dns_pods_high_filter_override |
| cpu_on_dns_pods_high_alerting_enabled  | True                                     | No       |                                                                                                      |
| cpu_on_dns_pods_high_no_data_timeframe | null                                     | No       |                                                                                                      |
| cpu_on_dns_pods_high_notify_no_data    | False                                    | No       |                                                                                                      |
| cpu_on_dns_pods_high_ok_threshold      | null                                     | No       |                                                                                                      |
| cpu_on_dns_pods_high_priority          | 2                                        | No       | Number from 1 (high) to 5 (low).                                                                     |


## Node Diskpressure

| variable                            | default                                  | required | description                                                           |
|-------------------------------------|------------------------------------------|----------|-----------------------------------------------------------------------|
| node_diskpressure_enabled           | True                                     | No       |                                                                       |
| node_diskpressure_critical          | 0                                        | No       | alert is raised when (desired - running) > node_diskpressure_critical |
| node_diskpressure_evaluation_period | last_5m                                  | No       |                                                                       |
| node_diskpressure_severity          | minor                                    | No       |                                                                       |
| node_diskpressure_note              | ""                                       | No       |                                                                       |
| node_diskpressure_docs              | Disk pressure is a condition indicating that a node is using too much disk space or is using disk space too fast, according to the thresholds you have set in your Kubernetes configuration. This is important to monitor because it might mean that you need to add more disk space, if your application legitimately needs more space. Or it might mean that an application is misbehaving and filling up the disk prematurely in an unanticipated manner. Either way, it’s a condition which needs your attention. | No       |                                                                       |
| node_diskpressure_filter_override   | ""                                       | No       |                                                                       |
| node_diskpressure_alerting_enabled  | True                                     | No       |                                                                       |
| node_diskpressure_no_data_timeframe | null                                     | No       |                                                                       |
| node_diskpressure_notify_no_data    | False                                    | No       |                                                                       |
| node_diskpressure_ok_threshold      | null                                     | No       |                                                                       |
| node_diskpressure_priority          | 3                                        | No       | Number from 1 (high) to 5 (low).                                      |


## Memory Requests Low

| variable                              | default                                  | required | description                      |
|---------------------------------------|------------------------------------------|----------|----------------------------------|
| memory_requests_low_enabled           | True                                     | No       |                                  |
| memory_requests_low_warning           | 4000000000                               | No       |                                  |
| memory_requests_low_critical          | 3000000000                               | No       |                                  |
| memory_requests_low_evaluation_period | last_5m                                  | No       |                                  |
| memory_requests_low_severity          | minor                                    | No       |                                  |
| memory_requests_low_note              | ""                                       | No       |                                  |
| memory_requests_low_docs              | Based on usage this might be expected behaviour. In Kubernetes however it is a common practice to over provision resources by setting higher limits. If everything has already been allocated by requests, no hardware resources will be left to over provision with. | No       |                                  |
| memory_requests_low_filter_override   | ""                                       | No       |                                  |
| memory_requests_low_alerting_enabled  | True                                     | No       |                                  |
| memory_requests_low_no_data_timeframe | null                                     | No       |                                  |
| memory_requests_low_notify_no_data    | False                                    | No       |                                  |
| memory_requests_low_ok_threshold      | null                                     | No       |                                  |
| memory_requests_low_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                 | default    | required | description  |
|--------------------------|------------|----------|--------------|
| env                      |            | Yes      |              |
| alert_env                |            | Yes      |              |
| service                  | Kubernetes | No       |              |
| notification_channel     |            | Yes      |              |
| additional_tags          | []         | No       |              |
| filter_str               |            | Yes      |              |
| locked                   | True       | No       |              |
| state_metrics_monitoring | True       | No       |              |
| name_prefix              | ""         | No       |              |
| name_suffix              | ""         | No       |              |



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 2.26 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cpu_limits_low"></a> [cpu\_limits\_low](#module\_cpu\_limits\_low) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_limits_low_perc"></a> [cpu\_limits\_low\_perc](#module\_cpu\_limits\_low\_perc) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_limits_low_perc_state"></a> [cpu\_limits\_low\_perc\_state](#module\_cpu\_limits\_low\_perc\_state) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_on_dns_pods_high"></a> [cpu\_on\_dns\_pods\_high](#module\_cpu\_on\_dns\_pods\_high) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_requests_low"></a> [cpu\_requests\_low](#module\_cpu\_requests\_low) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_requests_low_perc"></a> [cpu\_requests\_low\_perc](#module\_cpu\_requests\_low\_perc) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_cpu_requests_low_perc_state"></a> [cpu\_requests\_low\_perc\_state](#module\_cpu\_requests\_low\_perc\_state) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_daemonset_incomplete"></a> [daemonset\_incomplete](#module\_daemonset\_incomplete) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_datadog_agent"></a> [datadog\_agent](#module\_datadog\_agent) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_deploy_desired_vs_status"></a> [deploy\_desired\_vs\_status](#module\_deploy\_desired\_vs\_status) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_hpa_status"></a> [hpa\_status](#module\_hpa\_status) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_limits_low"></a> [memory\_limits\_low](#module\_memory\_limits\_low) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_limits_low_perc"></a> [memory\_limits\_low\_perc](#module\_memory\_limits\_low\_perc) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_limits_low_perc_state"></a> [memory\_limits\_low\_perc\_state](#module\_memory\_limits\_low\_perc\_state) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_requests_low"></a> [memory\_requests\_low](#module\_memory\_requests\_low) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_requests_low_perc"></a> [memory\_requests\_low\_perc](#module\_memory\_requests\_low\_perc) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_memory_requests_low_perc_state"></a> [memory\_requests\_low\_perc\_state](#module\_memory\_requests\_low\_perc\_state) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_network_unavailable"></a> [network\_unavailable](#module\_network\_unavailable) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_node_diskpressure"></a> [node\_diskpressure](#module\_node\_diskpressure) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_node_memory_used_percent"></a> [node\_memory\_used\_percent](#module\_node\_memory\_used\_percent) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_node_memorypressure"></a> [node\_memorypressure](#module\_node\_memorypressure) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_node_ready"></a> [node\_ready](#module\_node\_ready) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_node_status"></a> [node\_status](#module\_node\_status) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_persistent_volumes_low"></a> [persistent\_volumes\_low](#module\_persistent\_volumes\_low) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_pid_pressure"></a> [pid\_pressure](#module\_pid\_pressure) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_pod_ready"></a> [pod\_ready](#module\_pod\_ready) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_pod_restarts"></a> [pod\_restarts](#module\_pod\_restarts) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_replicaset_incomplete"></a> [replicaset\_incomplete](#module\_replicaset\_incomplete) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |
| <a name="module_replicaset_unavailable"></a> [replicaset\_unavailable](#module\_replicaset\_unavailable) | git@github.com:kabisa/terraform-datadog-generic-monitor.git | 0.6.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | n/a | `list(string)` | `[]` | no |
| <a name="input_alert_env"></a> [alert\_env](#input\_alert\_env) | n/a | `string` | n/a | yes |
| <a name="input_cpu_limits_low_alerting_enabled"></a> [cpu\_limits\_low\_alerting\_enabled](#input\_cpu\_limits\_low\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_limits_low_critical"></a> [cpu\_limits\_low\_critical](#input\_cpu\_limits\_low\_critical) | n/a | `number` | `-30` | no |
| <a name="input_cpu_limits_low_docs"></a> [cpu\_limits\_low\_docs](#input\_cpu\_limits\_low\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_limits_low_enabled"></a> [cpu\_limits\_low\_enabled](#input\_cpu\_limits\_low\_enabled) | This monitor is based on absolute values and thus less useful. Prefer setting cpu\_limits\_low\_perc\_enabled to true. | `bool` | `false` | no |
| <a name="input_cpu_limits_low_evaluation_period"></a> [cpu\_limits\_low\_evaluation\_period](#input\_cpu\_limits\_low\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_limits_low_filter_override"></a> [cpu\_limits\_low\_filter\_override](#input\_cpu\_limits\_low\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_no_data_timeframe"></a> [cpu\_limits\_low\_no\_data\_timeframe](#input\_cpu\_limits\_low\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_note"></a> [cpu\_limits\_low\_note](#input\_cpu\_limits\_low\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_notify_no_data"></a> [cpu\_limits\_low\_notify\_no\_data](#input\_cpu\_limits\_low\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_limits_low_ok_threshold"></a> [cpu\_limits\_low\_ok\_threshold](#input\_cpu\_limits\_low\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_perc_alerting_enabled"></a> [cpu\_limits\_low\_perc\_alerting\_enabled](#input\_cpu\_limits\_low\_perc\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_limits_low_perc_critical"></a> [cpu\_limits\_low\_perc\_critical](#input\_cpu\_limits\_low\_perc\_critical) | n/a | `number` | `100` | no |
| <a name="input_cpu_limits_low_perc_docs"></a> [cpu\_limits\_low\_perc\_docs](#input\_cpu\_limits\_low\_perc\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_limits_low_perc_enabled"></a> [cpu\_limits\_low\_perc\_enabled](#input\_cpu\_limits\_low\_perc\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_limits_low_perc_evaluation_period"></a> [cpu\_limits\_low\_perc\_evaluation\_period](#input\_cpu\_limits\_low\_perc\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_limits_low_perc_filter_override"></a> [cpu\_limits\_low\_perc\_filter\_override](#input\_cpu\_limits\_low\_perc\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_perc_no_data_timeframe"></a> [cpu\_limits\_low\_perc\_no\_data\_timeframe](#input\_cpu\_limits\_low\_perc\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_perc_note"></a> [cpu\_limits\_low\_perc\_note](#input\_cpu\_limits\_low\_perc\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_perc_notify_no_data"></a> [cpu\_limits\_low\_perc\_notify\_no\_data](#input\_cpu\_limits\_low\_perc\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_limits_low_perc_ok_threshold"></a> [cpu\_limits\_low\_perc\_ok\_threshold](#input\_cpu\_limits\_low\_perc\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_perc_priority"></a> [cpu\_limits\_low\_perc\_priority](#input\_cpu\_limits\_low\_perc\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_limits_low_perc_state_alerting_enabled"></a> [cpu\_limits\_low\_perc\_state\_alerting\_enabled](#input\_cpu\_limits\_low\_perc\_state\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_limits_low_perc_state_critical"></a> [cpu\_limits\_low\_perc\_state\_critical](#input\_cpu\_limits\_low\_perc\_state\_critical) | n/a | `number` | `100` | no |
| <a name="input_cpu_limits_low_perc_state_docs"></a> [cpu\_limits\_low\_perc\_state\_docs](#input\_cpu\_limits\_low\_perc\_state\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_limits_low_perc_state_enabled"></a> [cpu\_limits\_low\_perc\_state\_enabled](#input\_cpu\_limits\_low\_perc\_state\_enabled) | CPU state limits are only available when the state metrics api is deployed https://github.com/kubernetes/kube-state-metrics | `bool` | `false` | no |
| <a name="input_cpu_limits_low_perc_state_evaluation_period"></a> [cpu\_limits\_low\_perc\_state\_evaluation\_period](#input\_cpu\_limits\_low\_perc\_state\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_limits_low_perc_state_filter_override"></a> [cpu\_limits\_low\_perc\_state\_filter\_override](#input\_cpu\_limits\_low\_perc\_state\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_perc_state_no_data_timeframe"></a> [cpu\_limits\_low\_perc\_state\_no\_data\_timeframe](#input\_cpu\_limits\_low\_perc\_state\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_perc_state_note"></a> [cpu\_limits\_low\_perc\_state\_note](#input\_cpu\_limits\_low\_perc\_state\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_limits_low_perc_state_notify_no_data"></a> [cpu\_limits\_low\_perc\_state\_notify\_no\_data](#input\_cpu\_limits\_low\_perc\_state\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_limits_low_perc_state_ok_threshold"></a> [cpu\_limits\_low\_perc\_state\_ok\_threshold](#input\_cpu\_limits\_low\_perc\_state\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_limits_low_perc_state_priority"></a> [cpu\_limits\_low\_perc\_state\_priority](#input\_cpu\_limits\_low\_perc\_state\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_limits_low_perc_state_warning"></a> [cpu\_limits\_low\_perc\_state\_warning](#input\_cpu\_limits\_low\_perc\_state\_warning) | n/a | `number` | `95` | no |
| <a name="input_cpu_limits_low_perc_warning"></a> [cpu\_limits\_low\_perc\_warning](#input\_cpu\_limits\_low\_perc\_warning) | n/a | `number` | `95` | no |
| <a name="input_cpu_limits_low_priority"></a> [cpu\_limits\_low\_priority](#input\_cpu\_limits\_low\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_limits_low_warning"></a> [cpu\_limits\_low\_warning](#input\_cpu\_limits\_low\_warning) | n/a | `number` | `0` | no |
| <a name="input_cpu_on_dns_pods_high_alerting_enabled"></a> [cpu\_on\_dns\_pods\_high\_alerting\_enabled](#input\_cpu\_on\_dns\_pods\_high\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_on_dns_pods_high_critical"></a> [cpu\_on\_dns\_pods\_high\_critical](#input\_cpu\_on\_dns\_pods\_high\_critical) | n/a | `number` | `85` | no |
| <a name="input_cpu_on_dns_pods_high_docs"></a> [cpu\_on\_dns\_pods\_high\_docs](#input\_cpu\_on\_dns\_pods\_high\_docs) | n/a | `string` | `""` | no |
| <a name="input_cpu_on_dns_pods_high_enabled"></a> [cpu\_on\_dns\_pods\_high\_enabled](#input\_cpu\_on\_dns\_pods\_high\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_on_dns_pods_high_evaluation_period"></a> [cpu\_on\_dns\_pods\_high\_evaluation\_period](#input\_cpu\_on\_dns\_pods\_high\_evaluation\_period) | n/a | `string` | `"last_30m"` | no |
| <a name="input_cpu_on_dns_pods_high_filter_override"></a> [cpu\_on\_dns\_pods\_high\_filter\_override](#input\_cpu\_on\_dns\_pods\_high\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_on_dns_pods_high_no_data_timeframe"></a> [cpu\_on\_dns\_pods\_high\_no\_data\_timeframe](#input\_cpu\_on\_dns\_pods\_high\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_on_dns_pods_high_note"></a> [cpu\_on\_dns\_pods\_high\_note](#input\_cpu\_on\_dns\_pods\_high\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_on_dns_pods_high_notify_no_data"></a> [cpu\_on\_dns\_pods\_high\_notify\_no\_data](#input\_cpu\_on\_dns\_pods\_high\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_on_dns_pods_high_ok_threshold"></a> [cpu\_on\_dns\_pods\_high\_ok\_threshold](#input\_cpu\_on\_dns\_pods\_high\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_on_dns_pods_high_priority"></a> [cpu\_on\_dns\_pods\_high\_priority](#input\_cpu\_on\_dns\_pods\_high\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_cpu_on_dns_pods_high_warning"></a> [cpu\_on\_dns\_pods\_high\_warning](#input\_cpu\_on\_dns\_pods\_high\_warning) | n/a | `number` | `70` | no |
| <a name="input_cpu_requests_low_alerting_enabled"></a> [cpu\_requests\_low\_alerting\_enabled](#input\_cpu\_requests\_low\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_requests_low_critical"></a> [cpu\_requests\_low\_critical](#input\_cpu\_requests\_low\_critical) | n/a | `number` | `"0.5"` | no |
| <a name="input_cpu_requests_low_docs"></a> [cpu\_requests\_low\_docs](#input\_cpu\_requests\_low\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_requests_low_enabled"></a> [cpu\_requests\_low\_enabled](#input\_cpu\_requests\_low\_enabled) | This monitor is based on absolute values and thus less useful. Prefer setting cpu\_requests\_low\_perc\_enabled to true. | `bool` | `false` | no |
| <a name="input_cpu_requests_low_evaluation_period"></a> [cpu\_requests\_low\_evaluation\_period](#input\_cpu\_requests\_low\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_requests_low_filter_override"></a> [cpu\_requests\_low\_filter\_override](#input\_cpu\_requests\_low\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_no_data_timeframe"></a> [cpu\_requests\_low\_no\_data\_timeframe](#input\_cpu\_requests\_low\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_note"></a> [cpu\_requests\_low\_note](#input\_cpu\_requests\_low\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_notify_no_data"></a> [cpu\_requests\_low\_notify\_no\_data](#input\_cpu\_requests\_low\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_requests_low_ok_threshold"></a> [cpu\_requests\_low\_ok\_threshold](#input\_cpu\_requests\_low\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_perc_alerting_enabled"></a> [cpu\_requests\_low\_perc\_alerting\_enabled](#input\_cpu\_requests\_low\_perc\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_requests_low_perc_critical"></a> [cpu\_requests\_low\_perc\_critical](#input\_cpu\_requests\_low\_perc\_critical) | n/a | `number` | `95` | no |
| <a name="input_cpu_requests_low_perc_docs"></a> [cpu\_requests\_low\_perc\_docs](#input\_cpu\_requests\_low\_perc\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_requests_low_perc_enabled"></a> [cpu\_requests\_low\_perc\_enabled](#input\_cpu\_requests\_low\_perc\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_requests_low_perc_evaluation_period"></a> [cpu\_requests\_low\_perc\_evaluation\_period](#input\_cpu\_requests\_low\_perc\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_requests_low_perc_filter_override"></a> [cpu\_requests\_low\_perc\_filter\_override](#input\_cpu\_requests\_low\_perc\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_perc_no_data_timeframe"></a> [cpu\_requests\_low\_perc\_no\_data\_timeframe](#input\_cpu\_requests\_low\_perc\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_perc_note"></a> [cpu\_requests\_low\_perc\_note](#input\_cpu\_requests\_low\_perc\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_perc_notify_no_data"></a> [cpu\_requests\_low\_perc\_notify\_no\_data](#input\_cpu\_requests\_low\_perc\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_requests_low_perc_ok_threshold"></a> [cpu\_requests\_low\_perc\_ok\_threshold](#input\_cpu\_requests\_low\_perc\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_perc_priority"></a> [cpu\_requests\_low\_perc\_priority](#input\_cpu\_requests\_low\_perc\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_requests_low_perc_state_alerting_enabled"></a> [cpu\_requests\_low\_perc\_state\_alerting\_enabled](#input\_cpu\_requests\_low\_perc\_state\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cpu_requests_low_perc_state_critical"></a> [cpu\_requests\_low\_perc\_state\_critical](#input\_cpu\_requests\_low\_perc\_state\_critical) | n/a | `number` | `95` | no |
| <a name="input_cpu_requests_low_perc_state_docs"></a> [cpu\_requests\_low\_perc\_state\_docs](#input\_cpu\_requests\_low\_perc\_state\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_cpu_requests_low_perc_state_enabled"></a> [cpu\_requests\_low\_perc\_state\_enabled](#input\_cpu\_requests\_low\_perc\_state\_enabled) | CPU state limits are only available when the state metrics api is deployed https://github.com/kubernetes/kube-state-metrics | `bool` | `false` | no |
| <a name="input_cpu_requests_low_perc_state_evaluation_period"></a> [cpu\_requests\_low\_perc\_state\_evaluation\_period](#input\_cpu\_requests\_low\_perc\_state\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_cpu_requests_low_perc_state_filter_override"></a> [cpu\_requests\_low\_perc\_state\_filter\_override](#input\_cpu\_requests\_low\_perc\_state\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_perc_state_no_data_timeframe"></a> [cpu\_requests\_low\_perc\_state\_no\_data\_timeframe](#input\_cpu\_requests\_low\_perc\_state\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_perc_state_note"></a> [cpu\_requests\_low\_perc\_state\_note](#input\_cpu\_requests\_low\_perc\_state\_note) | n/a | `string` | `""` | no |
| <a name="input_cpu_requests_low_perc_state_notify_no_data"></a> [cpu\_requests\_low\_perc\_state\_notify\_no\_data](#input\_cpu\_requests\_low\_perc\_state\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_cpu_requests_low_perc_state_ok_threshold"></a> [cpu\_requests\_low\_perc\_state\_ok\_threshold](#input\_cpu\_requests\_low\_perc\_state\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_cpu_requests_low_perc_state_priority"></a> [cpu\_requests\_low\_perc\_state\_priority](#input\_cpu\_requests\_low\_perc\_state\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_requests_low_perc_state_warning"></a> [cpu\_requests\_low\_perc\_state\_warning](#input\_cpu\_requests\_low\_perc\_state\_warning) | n/a | `number` | `80` | no |
| <a name="input_cpu_requests_low_perc_warning"></a> [cpu\_requests\_low\_perc\_warning](#input\_cpu\_requests\_low\_perc\_warning) | n/a | `number` | `80` | no |
| <a name="input_cpu_requests_low_priority"></a> [cpu\_requests\_low\_priority](#input\_cpu\_requests\_low\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_cpu_requests_low_warning"></a> [cpu\_requests\_low\_warning](#input\_cpu\_requests\_low\_warning) | n/a | `number` | `1` | no |
| <a name="input_daemonset_incomplete_alerting_enabled"></a> [daemonset\_incomplete\_alerting\_enabled](#input\_daemonset\_incomplete\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_daemonset_incomplete_critical"></a> [daemonset\_incomplete\_critical](#input\_daemonset\_incomplete\_critical) | alert is raised when (desired - running) > daemonset\_incomplete\_critical | `number` | `0` | no |
| <a name="input_daemonset_incomplete_docs"></a> [daemonset\_incomplete\_docs](#input\_daemonset\_incomplete\_docs) | n/a | `string` | `"In kubernetes a daemonset is responsible for running the same pod across all Nodes. An example for a reason for this not not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0"` | no |
| <a name="input_daemonset_incomplete_enabled"></a> [daemonset\_incomplete\_enabled](#input\_daemonset\_incomplete\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_daemonset_incomplete_evaluation_period"></a> [daemonset\_incomplete\_evaluation\_period](#input\_daemonset\_incomplete\_evaluation\_period) | n/a | `string` | `"last_30m"` | no |
| <a name="input_daemonset_incomplete_filter_override"></a> [daemonset\_incomplete\_filter\_override](#input\_daemonset\_incomplete\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_daemonset_incomplete_no_data_timeframe"></a> [daemonset\_incomplete\_no\_data\_timeframe](#input\_daemonset\_incomplete\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_daemonset_incomplete_note"></a> [daemonset\_incomplete\_note](#input\_daemonset\_incomplete\_note) | n/a | `string` | `""` | no |
| <a name="input_daemonset_incomplete_notify_no_data"></a> [daemonset\_incomplete\_notify\_no\_data](#input\_daemonset\_incomplete\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_daemonset_incomplete_ok_threshold"></a> [daemonset\_incomplete\_ok\_threshold](#input\_daemonset\_incomplete\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_daemonset_incomplete_priority"></a> [daemonset\_incomplete\_priority](#input\_daemonset\_incomplete\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_datadog_agent_alerting_enabled"></a> [datadog\_agent\_alerting\_enabled](#input\_datadog\_agent\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_datadog_agent_docs"></a> [datadog\_agent\_docs](#input\_datadog\_agent\_docs) | n/a | `string` | `""` | no |
| <a name="input_datadog_agent_enabled"></a> [datadog\_agent\_enabled](#input\_datadog\_agent\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_datadog_agent_evaluation_period"></a> [datadog\_agent\_evaluation\_period](#input\_datadog\_agent\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_datadog_agent_filter_override"></a> [datadog\_agent\_filter\_override](#input\_datadog\_agent\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_datadog_agent_no_data_timeframe"></a> [datadog\_agent\_no\_data\_timeframe](#input\_datadog\_agent\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_datadog_agent_note"></a> [datadog\_agent\_note](#input\_datadog\_agent\_note) | n/a | `string` | `""` | no |
| <a name="input_datadog_agent_notify_no_data"></a> [datadog\_agent\_notify\_no\_data](#input\_datadog\_agent\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_datadog_agent_ok_threshold"></a> [datadog\_agent\_ok\_threshold](#input\_datadog\_agent\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_datadog_agent_priority"></a> [datadog\_agent\_priority](#input\_datadog\_agent\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_deploy_desired_vs_status_alerting_enabled"></a> [deploy\_desired\_vs\_status\_alerting\_enabled](#input\_deploy\_desired\_vs\_status\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_deploy_desired_vs_status_critical"></a> [deploy\_desired\_vs\_status\_critical](#input\_deploy\_desired\_vs\_status\_critical) | n/a | `number` | `10` | no |
| <a name="input_deploy_desired_vs_status_docs"></a> [deploy\_desired\_vs\_status\_docs](#input\_deploy\_desired\_vs\_status\_docs) | n/a | `string` | `"The amount of expected pods to run minus the actual number"` | no |
| <a name="input_deploy_desired_vs_status_enabled"></a> [deploy\_desired\_vs\_status\_enabled](#input\_deploy\_desired\_vs\_status\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_deploy_desired_vs_status_evaluation_period"></a> [deploy\_desired\_vs\_status\_evaluation\_period](#input\_deploy\_desired\_vs\_status\_evaluation\_period) | n/a | `string` | `"last_15m"` | no |
| <a name="input_deploy_desired_vs_status_filter_override"></a> [deploy\_desired\_vs\_status\_filter\_override](#input\_deploy\_desired\_vs\_status\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_deploy_desired_vs_status_no_data_timeframe"></a> [deploy\_desired\_vs\_status\_no\_data\_timeframe](#input\_deploy\_desired\_vs\_status\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_deploy_desired_vs_status_note"></a> [deploy\_desired\_vs\_status\_note](#input\_deploy\_desired\_vs\_status\_note) | n/a | `string` | `""` | no |
| <a name="input_deploy_desired_vs_status_notify_no_data"></a> [deploy\_desired\_vs\_status\_notify\_no\_data](#input\_deploy\_desired\_vs\_status\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_deploy_desired_vs_status_ok_threshold"></a> [deploy\_desired\_vs\_status\_ok\_threshold](#input\_deploy\_desired\_vs\_status\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_deploy_desired_vs_status_priority"></a> [deploy\_desired\_vs\_status\_priority](#input\_deploy\_desired\_vs\_status\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_deploy_desired_vs_status_warning"></a> [deploy\_desired\_vs\_status\_warning](#input\_deploy\_desired\_vs\_status\_warning) | n/a | `number` | `1` | no |
| <a name="input_dns_filter_tags"></a> [dns\_filter\_tags](#input\_dns\_filter\_tags) | Getting all the DNS containers by default is hard to do.<br>What we try is to make a list of datadog tags / filters that should help us find those<br>We then build a filter in the following way: ($originalfilterstring) AND (item1 OR item2 OR item3...)<br>If that doesn't work for your use-cause you can override the filter list or use cpu\_on\_dns\_pods\_high\_filter\_override | `list(string)` | <pre>[<br>  "kube_service:kube-dns",<br>  "short_image:coredns",<br>  "short_image:ucp-coredns",<br>  "short_image:ucp-kube-dns"<br>]</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_filter_str"></a> [filter\_str](#input\_filter\_str) | n/a | `string` | n/a | yes |
| <a name="input_hpa_status_alerting_enabled"></a> [hpa\_status\_alerting\_enabled](#input\_hpa\_status\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_hpa_status_docs"></a> [hpa\_status\_docs](#input\_hpa\_status\_docs) | n/a | `string` | `"The Horizontal Pod Autoscaler automatically scales the number of Pods in a replication controller, deployment, replica set or stateful set based on observed CPU utilization\nWhen the HPA is unavailable, the situation could arise that not enough resources are provisioned to handle the incoming load\nhttps://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/"` | no |
| <a name="input_hpa_status_enabled"></a> [hpa\_status\_enabled](#input\_hpa\_status\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_hpa_status_evaluation_period"></a> [hpa\_status\_evaluation\_period](#input\_hpa\_status\_evaluation\_period) | n/a | `string` | `"last_15m"` | no |
| <a name="input_hpa_status_filter_override"></a> [hpa\_status\_filter\_override](#input\_hpa\_status\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_hpa_status_no_data_timeframe"></a> [hpa\_status\_no\_data\_timeframe](#input\_hpa\_status\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_hpa_status_note"></a> [hpa\_status\_note](#input\_hpa\_status\_note) | n/a | `string` | `""` | no |
| <a name="input_hpa_status_notify_no_data"></a> [hpa\_status\_notify\_no\_data](#input\_hpa\_status\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_hpa_status_ok_threshold"></a> [hpa\_status\_ok\_threshold](#input\_hpa\_status\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_hpa_status_priority"></a> [hpa\_status\_priority](#input\_hpa\_status\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_locked"></a> [locked](#input\_locked) | Makes sure only the creator or admin can modify the monitor | `bool` | `true` | no |
| <a name="input_memory_limits_low_alerting_enabled"></a> [memory\_limits\_low\_alerting\_enabled](#input\_memory\_limits\_low\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_limits_low_critical"></a> [memory\_limits\_low\_critical](#input\_memory\_limits\_low\_critical) | n/a | `number` | `3000000000` | no |
| <a name="input_memory_limits_low_docs"></a> [memory\_limits\_low\_docs](#input\_memory\_limits\_low\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_limits_low_enabled"></a> [memory\_limits\_low\_enabled](#input\_memory\_limits\_low\_enabled) | This monitor is based on absolute values and thus less useful. Prefer setting memory\_limits\_low\_perc\_enabled to true. | `bool` | `false` | no |
| <a name="input_memory_limits_low_evaluation_period"></a> [memory\_limits\_low\_evaluation\_period](#input\_memory\_limits\_low\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_limits_low_filter_override"></a> [memory\_limits\_low\_filter\_override](#input\_memory\_limits\_low\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_no_data_timeframe"></a> [memory\_limits\_low\_no\_data\_timeframe](#input\_memory\_limits\_low\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_note"></a> [memory\_limits\_low\_note](#input\_memory\_limits\_low\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_notify_no_data"></a> [memory\_limits\_low\_notify\_no\_data](#input\_memory\_limits\_low\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_limits_low_ok_threshold"></a> [memory\_limits\_low\_ok\_threshold](#input\_memory\_limits\_low\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_perc_alerting_enabled"></a> [memory\_limits\_low\_perc\_alerting\_enabled](#input\_memory\_limits\_low\_perc\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_limits_low_perc_critical"></a> [memory\_limits\_low\_perc\_critical](#input\_memory\_limits\_low\_perc\_critical) | n/a | `number` | `100` | no |
| <a name="input_memory_limits_low_perc_docs"></a> [memory\_limits\_low\_perc\_docs](#input\_memory\_limits\_low\_perc\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_limits_low_perc_enabled"></a> [memory\_limits\_low\_perc\_enabled](#input\_memory\_limits\_low\_perc\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_limits_low_perc_evaluation_period"></a> [memory\_limits\_low\_perc\_evaluation\_period](#input\_memory\_limits\_low\_perc\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_limits_low_perc_filter_override"></a> [memory\_limits\_low\_perc\_filter\_override](#input\_memory\_limits\_low\_perc\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_perc_no_data_timeframe"></a> [memory\_limits\_low\_perc\_no\_data\_timeframe](#input\_memory\_limits\_low\_perc\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_perc_note"></a> [memory\_limits\_low\_perc\_note](#input\_memory\_limits\_low\_perc\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_perc_notify_no_data"></a> [memory\_limits\_low\_perc\_notify\_no\_data](#input\_memory\_limits\_low\_perc\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_limits_low_perc_ok_threshold"></a> [memory\_limits\_low\_perc\_ok\_threshold](#input\_memory\_limits\_low\_perc\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_perc_priority"></a> [memory\_limits\_low\_perc\_priority](#input\_memory\_limits\_low\_perc\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_limits_low_perc_state_alerting_enabled"></a> [memory\_limits\_low\_perc\_state\_alerting\_enabled](#input\_memory\_limits\_low\_perc\_state\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_limits_low_perc_state_critical"></a> [memory\_limits\_low\_perc\_state\_critical](#input\_memory\_limits\_low\_perc\_state\_critical) | n/a | `number` | `100` | no |
| <a name="input_memory_limits_low_perc_state_docs"></a> [memory\_limits\_low\_perc\_state\_docs](#input\_memory\_limits\_low\_perc\_state\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_limits_low_perc_state_enabled"></a> [memory\_limits\_low\_perc\_state\_enabled](#input\_memory\_limits\_low\_perc\_state\_enabled) | Memory state limits are only available when the state metrics api is deployed https://github.com/kubernetes/kube-state-metrics | `bool` | `false` | no |
| <a name="input_memory_limits_low_perc_state_evaluation_period"></a> [memory\_limits\_low\_perc\_state\_evaluation\_period](#input\_memory\_limits\_low\_perc\_state\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_limits_low_perc_state_filter_override"></a> [memory\_limits\_low\_perc\_state\_filter\_override](#input\_memory\_limits\_low\_perc\_state\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_perc_state_no_data_timeframe"></a> [memory\_limits\_low\_perc\_state\_no\_data\_timeframe](#input\_memory\_limits\_low\_perc\_state\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_perc_state_note"></a> [memory\_limits\_low\_perc\_state\_note](#input\_memory\_limits\_low\_perc\_state\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_limits_low_perc_state_notify_no_data"></a> [memory\_limits\_low\_perc\_state\_notify\_no\_data](#input\_memory\_limits\_low\_perc\_state\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_limits_low_perc_state_ok_threshold"></a> [memory\_limits\_low\_perc\_state\_ok\_threshold](#input\_memory\_limits\_low\_perc\_state\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_limits_low_perc_state_priority"></a> [memory\_limits\_low\_perc\_state\_priority](#input\_memory\_limits\_low\_perc\_state\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_limits_low_perc_state_warning"></a> [memory\_limits\_low\_perc\_state\_warning](#input\_memory\_limits\_low\_perc\_state\_warning) | n/a | `number` | `95` | no |
| <a name="input_memory_limits_low_perc_warning"></a> [memory\_limits\_low\_perc\_warning](#input\_memory\_limits\_low\_perc\_warning) | n/a | `number` | `95` | no |
| <a name="input_memory_limits_low_priority"></a> [memory\_limits\_low\_priority](#input\_memory\_limits\_low\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_limits_low_warning"></a> [memory\_limits\_low\_warning](#input\_memory\_limits\_low\_warning) | n/a | `number` | `4000000000` | no |
| <a name="input_memory_requests_low_alerting_enabled"></a> [memory\_requests\_low\_alerting\_enabled](#input\_memory\_requests\_low\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_requests_low_critical"></a> [memory\_requests\_low\_critical](#input\_memory\_requests\_low\_critical) | n/a | `number` | `3000000000` | no |
| <a name="input_memory_requests_low_docs"></a> [memory\_requests\_low\_docs](#input\_memory\_requests\_low\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_requests_low_enabled"></a> [memory\_requests\_low\_enabled](#input\_memory\_requests\_low\_enabled) | This monitor is based on absolute values and thus less useful. Prefer setting memory\_requests\_low\_perc\_enabled to true. | `bool` | `false` | no |
| <a name="input_memory_requests_low_evaluation_period"></a> [memory\_requests\_low\_evaluation\_period](#input\_memory\_requests\_low\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_requests_low_filter_override"></a> [memory\_requests\_low\_filter\_override](#input\_memory\_requests\_low\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_no_data_timeframe"></a> [memory\_requests\_low\_no\_data\_timeframe](#input\_memory\_requests\_low\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_note"></a> [memory\_requests\_low\_note](#input\_memory\_requests\_low\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_notify_no_data"></a> [memory\_requests\_low\_notify\_no\_data](#input\_memory\_requests\_low\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_requests_low_ok_threshold"></a> [memory\_requests\_low\_ok\_threshold](#input\_memory\_requests\_low\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_perc_alerting_enabled"></a> [memory\_requests\_low\_perc\_alerting\_enabled](#input\_memory\_requests\_low\_perc\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_requests_low_perc_critical"></a> [memory\_requests\_low\_perc\_critical](#input\_memory\_requests\_low\_perc\_critical) | n/a | `number` | `95` | no |
| <a name="input_memory_requests_low_perc_docs"></a> [memory\_requests\_low\_perc\_docs](#input\_memory\_requests\_low\_perc\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_requests_low_perc_enabled"></a> [memory\_requests\_low\_perc\_enabled](#input\_memory\_requests\_low\_perc\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_requests_low_perc_evaluation_period"></a> [memory\_requests\_low\_perc\_evaluation\_period](#input\_memory\_requests\_low\_perc\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_requests_low_perc_filter_override"></a> [memory\_requests\_low\_perc\_filter\_override](#input\_memory\_requests\_low\_perc\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_perc_no_data_timeframe"></a> [memory\_requests\_low\_perc\_no\_data\_timeframe](#input\_memory\_requests\_low\_perc\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_perc_note"></a> [memory\_requests\_low\_perc\_note](#input\_memory\_requests\_low\_perc\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_perc_notify_no_data"></a> [memory\_requests\_low\_perc\_notify\_no\_data](#input\_memory\_requests\_low\_perc\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_requests_low_perc_ok_threshold"></a> [memory\_requests\_low\_perc\_ok\_threshold](#input\_memory\_requests\_low\_perc\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_perc_priority"></a> [memory\_requests\_low\_perc\_priority](#input\_memory\_requests\_low\_perc\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_requests_low_perc_state_alerting_enabled"></a> [memory\_requests\_low\_perc\_state\_alerting\_enabled](#input\_memory\_requests\_low\_perc\_state\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_memory_requests_low_perc_state_critical"></a> [memory\_requests\_low\_perc\_state\_critical](#input\_memory\_requests\_low\_perc\_state\_critical) | n/a | `number` | `95` | no |
| <a name="input_memory_requests_low_perc_state_docs"></a> [memory\_requests\_low\_perc\_state\_docs](#input\_memory\_requests\_low\_perc\_state\_docs) | n/a | `string` | `"If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit. https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"` | no |
| <a name="input_memory_requests_low_perc_state_enabled"></a> [memory\_requests\_low\_perc\_state\_enabled](#input\_memory\_requests\_low\_perc\_state\_enabled) | Memory state limits are only available when the state metrics api is deployed https://github.com/kubernetes/kube-state-metrics | `bool` | `false` | no |
| <a name="input_memory_requests_low_perc_state_evaluation_period"></a> [memory\_requests\_low\_perc\_state\_evaluation\_period](#input\_memory\_requests\_low\_perc\_state\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_memory_requests_low_perc_state_filter_override"></a> [memory\_requests\_low\_perc\_state\_filter\_override](#input\_memory\_requests\_low\_perc\_state\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_perc_state_no_data_timeframe"></a> [memory\_requests\_low\_perc\_state\_no\_data\_timeframe](#input\_memory\_requests\_low\_perc\_state\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_perc_state_note"></a> [memory\_requests\_low\_perc\_state\_note](#input\_memory\_requests\_low\_perc\_state\_note) | n/a | `string` | `""` | no |
| <a name="input_memory_requests_low_perc_state_notify_no_data"></a> [memory\_requests\_low\_perc\_state\_notify\_no\_data](#input\_memory\_requests\_low\_perc\_state\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_memory_requests_low_perc_state_ok_threshold"></a> [memory\_requests\_low\_perc\_state\_ok\_threshold](#input\_memory\_requests\_low\_perc\_state\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_memory_requests_low_perc_state_priority"></a> [memory\_requests\_low\_perc\_state\_priority](#input\_memory\_requests\_low\_perc\_state\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_requests_low_perc_state_warning"></a> [memory\_requests\_low\_perc\_state\_warning](#input\_memory\_requests\_low\_perc\_state\_warning) | n/a | `number` | `85` | no |
| <a name="input_memory_requests_low_perc_warning"></a> [memory\_requests\_low\_perc\_warning](#input\_memory\_requests\_low\_perc\_warning) | n/a | `number` | `85` | no |
| <a name="input_memory_requests_low_priority"></a> [memory\_requests\_low\_priority](#input\_memory\_requests\_low\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_memory_requests_low_warning"></a> [memory\_requests\_low\_warning](#input\_memory\_requests\_low\_warning) | n/a | `number` | `4000000000` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | n/a | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | n/a | `string` | `""` | no |
| <a name="input_network_unavailable_alerting_enabled"></a> [network\_unavailable\_alerting\_enabled](#input\_network\_unavailable\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_network_unavailable_critical"></a> [network\_unavailable\_critical](#input\_network\_unavailable\_critical) | alert is raised when (desired - running) > network\_unavailable\_critical | `number` | `0` | no |
| <a name="input_network_unavailable_docs"></a> [network\_unavailable\_docs](#input\_network\_unavailable\_docs) | n/a | `string` | `"All your nodes need network  connections, and this status indicates that there’s something wrong with a node’s network connection. Either it wasn’t set up properly (due to route exhaustion or a misconfiguration), or there’s a physical problem with the network connection to your hardware."` | no |
| <a name="input_network_unavailable_enabled"></a> [network\_unavailable\_enabled](#input\_network\_unavailable\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_network_unavailable_evaluation_period"></a> [network\_unavailable\_evaluation\_period](#input\_network\_unavailable\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_network_unavailable_filter_override"></a> [network\_unavailable\_filter\_override](#input\_network\_unavailable\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_network_unavailable_no_data_timeframe"></a> [network\_unavailable\_no\_data\_timeframe](#input\_network\_unavailable\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_network_unavailable_note"></a> [network\_unavailable\_note](#input\_network\_unavailable\_note) | n/a | `string` | `""` | no |
| <a name="input_network_unavailable_notify_no_data"></a> [network\_unavailable\_notify\_no\_data](#input\_network\_unavailable\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_network_unavailable_ok_threshold"></a> [network\_unavailable\_ok\_threshold](#input\_network\_unavailable\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_network_unavailable_priority"></a> [network\_unavailable\_priority](#input\_network\_unavailable\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_node_diskpressure_alerting_enabled"></a> [node\_diskpressure\_alerting\_enabled](#input\_node\_diskpressure\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_diskpressure_critical"></a> [node\_diskpressure\_critical](#input\_node\_diskpressure\_critical) | alert is raised when (desired - running) > node\_diskpressure\_critical | `number` | `0` | no |
| <a name="input_node_diskpressure_docs"></a> [node\_diskpressure\_docs](#input\_node\_diskpressure\_docs) | n/a | `string` | `"Disk pressure is a condition indicating that a node is using too much disk space or is using disk space too fast, according to the thresholds you have set in your Kubernetes configuration. This is important to monitor because it might mean that you need to add more disk space, if your application legitimately needs more space. Or it might mean that an application is misbehaving and filling up the disk prematurely in an unanticipated manner. Either way, it’s a condition which needs your attention."` | no |
| <a name="input_node_diskpressure_enabled"></a> [node\_diskpressure\_enabled](#input\_node\_diskpressure\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_diskpressure_evaluation_period"></a> [node\_diskpressure\_evaluation\_period](#input\_node\_diskpressure\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_node_diskpressure_filter_override"></a> [node\_diskpressure\_filter\_override](#input\_node\_diskpressure\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_node_diskpressure_no_data_timeframe"></a> [node\_diskpressure\_no\_data\_timeframe](#input\_node\_diskpressure\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_node_diskpressure_note"></a> [node\_diskpressure\_note](#input\_node\_diskpressure\_note) | n/a | `string` | `""` | no |
| <a name="input_node_diskpressure_notify_no_data"></a> [node\_diskpressure\_notify\_no\_data](#input\_node\_diskpressure\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_node_diskpressure_ok_threshold"></a> [node\_diskpressure\_ok\_threshold](#input\_node\_diskpressure\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_node_diskpressure_priority"></a> [node\_diskpressure\_priority](#input\_node\_diskpressure\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_node_memory_used_percent_alerting_enabled"></a> [node\_memory\_used\_percent\_alerting\_enabled](#input\_node\_memory\_used\_percent\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_memory_used_percent_critical"></a> [node\_memory\_used\_percent\_critical](#input\_node\_memory\_used\_percent\_critical) | n/a | `number` | `90` | no |
| <a name="input_node_memory_used_percent_docs"></a> [node\_memory\_used\_percent\_docs](#input\_node\_memory\_used\_percent\_docs) | n/a | `string` | `""` | no |
| <a name="input_node_memory_used_percent_enabled"></a> [node\_memory\_used\_percent\_enabled](#input\_node\_memory\_used\_percent\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_memory_used_percent_evaluation_period"></a> [node\_memory\_used\_percent\_evaluation\_period](#input\_node\_memory\_used\_percent\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_node_memory_used_percent_filter_override"></a> [node\_memory\_used\_percent\_filter\_override](#input\_node\_memory\_used\_percent\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_node_memory_used_percent_no_data_timeframe"></a> [node\_memory\_used\_percent\_no\_data\_timeframe](#input\_node\_memory\_used\_percent\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_node_memory_used_percent_note"></a> [node\_memory\_used\_percent\_note](#input\_node\_memory\_used\_percent\_note) | n/a | `string` | `""` | no |
| <a name="input_node_memory_used_percent_notify_no_data"></a> [node\_memory\_used\_percent\_notify\_no\_data](#input\_node\_memory\_used\_percent\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_node_memory_used_percent_ok_threshold"></a> [node\_memory\_used\_percent\_ok\_threshold](#input\_node\_memory\_used\_percent\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_node_memory_used_percent_priority"></a> [node\_memory\_used\_percent\_priority](#input\_node\_memory\_used\_percent\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_node_memory_used_percent_warning"></a> [node\_memory\_used\_percent\_warning](#input\_node\_memory\_used\_percent\_warning) | n/a | `number` | `80` | no |
| <a name="input_node_memorypressure_alerting_enabled"></a> [node\_memorypressure\_alerting\_enabled](#input\_node\_memorypressure\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_memorypressure_critical"></a> [node\_memorypressure\_critical](#input\_node\_memorypressure\_critical) | alert is raised when (desired - running) > node\_memorypressure\_critical | `number` | `0` | no |
| <a name="input_node_memorypressure_docs"></a> [node\_memorypressure\_docs](#input\_node\_memorypressure\_docs) | n/a | `string` | `"Memory pressure is a resourcing condition indicating that your node is running out of memory. Similar to CPU resourcing, you don’t want to run out of memory. You especially need to watch for this condition because it could mean there’s a memory leak in one of your applications."` | no |
| <a name="input_node_memorypressure_enabled"></a> [node\_memorypressure\_enabled](#input\_node\_memorypressure\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_memorypressure_evaluation_period"></a> [node\_memorypressure\_evaluation\_period](#input\_node\_memorypressure\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_node_memorypressure_filter_override"></a> [node\_memorypressure\_filter\_override](#input\_node\_memorypressure\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_node_memorypressure_no_data_timeframe"></a> [node\_memorypressure\_no\_data\_timeframe](#input\_node\_memorypressure\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_node_memorypressure_note"></a> [node\_memorypressure\_note](#input\_node\_memorypressure\_note) | n/a | `string` | `""` | no |
| <a name="input_node_memorypressure_notify_no_data"></a> [node\_memorypressure\_notify\_no\_data](#input\_node\_memorypressure\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_node_memorypressure_ok_threshold"></a> [node\_memorypressure\_ok\_threshold](#input\_node\_memorypressure\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_node_memorypressure_priority"></a> [node\_memorypressure\_priority](#input\_node\_memorypressure\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_node_ready_alerting_enabled"></a> [node\_ready\_alerting\_enabled](#input\_node\_ready\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_ready_critical"></a> [node\_ready\_critical](#input\_node\_ready\_critical) | n/a | `number` | `1` | no |
| <a name="input_node_ready_docs"></a> [node\_ready\_docs](#input\_node\_ready\_docs) | n/a | `string` | `"Checks to see if the node is in ready status or not"` | no |
| <a name="input_node_ready_enabled"></a> [node\_ready\_enabled](#input\_node\_ready\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_ready_evaluation_period"></a> [node\_ready\_evaluation\_period](#input\_node\_ready\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_node_ready_filter_override"></a> [node\_ready\_filter\_override](#input\_node\_ready\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_node_ready_no_data_timeframe"></a> [node\_ready\_no\_data\_timeframe](#input\_node\_ready\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_node_ready_note"></a> [node\_ready\_note](#input\_node\_ready\_note) | n/a | `string` | `""` | no |
| <a name="input_node_ready_notify_no_data"></a> [node\_ready\_notify\_no\_data](#input\_node\_ready\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_node_ready_ok_threshold"></a> [node\_ready\_ok\_threshold](#input\_node\_ready\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_node_ready_priority"></a> [node\_ready\_priority](#input\_node\_ready\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_node_status_alerting_enabled"></a> [node\_status\_alerting\_enabled](#input\_node\_status\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_status_docs"></a> [node\_status\_docs](#input\_node\_status\_docs) | n/a | `string` | `"This cluster state metric provides a high-level overview of a node’s health and whether the scheduler can place pods on that node. It runs checks on the following node conditions\nhttps://kubernetes.io/docs/concepts/architecture/nodes/#condition"` | no |
| <a name="input_node_status_enabled"></a> [node\_status\_enabled](#input\_node\_status\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_node_status_evaluation_period"></a> [node\_status\_evaluation\_period](#input\_node\_status\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_node_status_filter_override"></a> [node\_status\_filter\_override](#input\_node\_status\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_node_status_no_data_timeframe"></a> [node\_status\_no\_data\_timeframe](#input\_node\_status\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_node_status_note"></a> [node\_status\_note](#input\_node\_status\_note) | n/a | `string` | `""` | no |
| <a name="input_node_status_notify_no_data"></a> [node\_status\_notify\_no\_data](#input\_node\_status\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_node_status_ok_threshold"></a> [node\_status\_ok\_threshold](#input\_node\_status\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_node_status_priority"></a> [node\_status\_priority](#input\_node\_status\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_notification_channel"></a> [notification\_channel](#input\_notification\_channel) | n/a | `string` | n/a | yes |
| <a name="input_persistent_volumes_alerting_enabled"></a> [persistent\_volumes\_alerting\_enabled](#input\_persistent\_volumes\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_persistent_volumes_critical"></a> [persistent\_volumes\_critical](#input\_persistent\_volumes\_critical) | n/a | `number` | `1` | no |
| <a name="input_persistent_volumes_docs"></a> [persistent\_volumes\_docs](#input\_persistent\_volumes\_docs) | n/a | `string` | `""` | no |
| <a name="input_persistent_volumes_enabled"></a> [persistent\_volumes\_enabled](#input\_persistent\_volumes\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_persistent_volumes_evaluation_period"></a> [persistent\_volumes\_evaluation\_period](#input\_persistent\_volumes\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_persistent_volumes_filter_override"></a> [persistent\_volumes\_filter\_override](#input\_persistent\_volumes\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_persistent_volumes_no_data_timeframe"></a> [persistent\_volumes\_no\_data\_timeframe](#input\_persistent\_volumes\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_persistent_volumes_note"></a> [persistent\_volumes\_note](#input\_persistent\_volumes\_note) | n/a | `string` | `""` | no |
| <a name="input_persistent_volumes_notify_no_data"></a> [persistent\_volumes\_notify\_no\_data](#input\_persistent\_volumes\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_persistent_volumes_ok_threshold"></a> [persistent\_volumes\_ok\_threshold](#input\_persistent\_volumes\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_persistent_volumes_priority"></a> [persistent\_volumes\_priority](#input\_persistent\_volumes\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_persistent_volumes_warning"></a> [persistent\_volumes\_warning](#input\_persistent\_volumes\_warning) | n/a | `number` | `0` | no |
| <a name="input_pid_pressure_alerting_enabled"></a> [pid\_pressure\_alerting\_enabled](#input\_pid\_pressure\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pid_pressure_critical"></a> [pid\_pressure\_critical](#input\_pid\_pressure\_critical) | alert is raised when (desired - running) > pid\_pressure\_critical | `number` | `0` | no |
| <a name="input_pid_pressure_docs"></a> [pid\_pressure\_docs](#input\_pid\_pressure\_docs) | n/a | `string` | `"PID pressure is a rare condition where a pod or container spawns too many processes and starves the node of available process IDs. Each node has a limited number of process IDs to distribute amongst running processes; and if it runs out of IDs, no other processes can be started. Kubernetes lets you set PID thresholds for pods to limit their ability to perform runaway process-spawning, and a PID pressure condition means that one or more pods are using up their allocated PIDs and need to be examined."` | no |
| <a name="input_pid_pressure_enabled"></a> [pid\_pressure\_enabled](#input\_pid\_pressure\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pid_pressure_evaluation_period"></a> [pid\_pressure\_evaluation\_period](#input\_pid\_pressure\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_pid_pressure_filter_override"></a> [pid\_pressure\_filter\_override](#input\_pid\_pressure\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_pid_pressure_no_data_timeframe"></a> [pid\_pressure\_no\_data\_timeframe](#input\_pid\_pressure\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_pid_pressure_note"></a> [pid\_pressure\_note](#input\_pid\_pressure\_note) | n/a | `string` | `""` | no |
| <a name="input_pid_pressure_notify_no_data"></a> [pid\_pressure\_notify\_no\_data](#input\_pid\_pressure\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_pid_pressure_ok_threshold"></a> [pid\_pressure\_ok\_threshold](#input\_pid\_pressure\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_pid_pressure_priority"></a> [pid\_pressure\_priority](#input\_pid\_pressure\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_pod_ready_alerting_enabled"></a> [pod\_ready\_alerting\_enabled](#input\_pod\_ready\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pod_ready_docs"></a> [pod\_ready\_docs](#input\_pod\_ready\_docs) | n/a | `string` | `"A pod may be running but not available, meaning it is not ready and able to accept traffic. This is normal during certain circumstances, such as when a pod is newly launched or when a change is made and deployed to the specification of that pod. But if you see spikes in the number of unavailable pods, or pods that are consistently unavailable, it might indicate a problem with their configuration.\nhttps://www.datadoghq.com/blog/monitoring-kubernetes-performance-metrics/"` | no |
| <a name="input_pod_ready_enabled"></a> [pod\_ready\_enabled](#input\_pod\_ready\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pod_ready_evaluation_period"></a> [pod\_ready\_evaluation\_period](#input\_pod\_ready\_evaluation\_period) | n/a | `string` | `"last_30m"` | no |
| <a name="input_pod_ready_filter_override"></a> [pod\_ready\_filter\_override](#input\_pod\_ready\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_pod_ready_no_data_timeframe"></a> [pod\_ready\_no\_data\_timeframe](#input\_pod\_ready\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_pod_ready_note"></a> [pod\_ready\_note](#input\_pod\_ready\_note) | n/a | `string` | `""` | no |
| <a name="input_pod_ready_notify_no_data"></a> [pod\_ready\_notify\_no\_data](#input\_pod\_ready\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_pod_ready_ok_threshold"></a> [pod\_ready\_ok\_threshold](#input\_pod\_ready\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_pod_ready_priority"></a> [pod\_ready\_priority](#input\_pod\_ready\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_pod_restarts_alerting_enabled"></a> [pod\_restarts\_alerting\_enabled](#input\_pod\_restarts\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pod_restarts_critical"></a> [pod\_restarts\_critical](#input\_pod\_restarts\_critical) | n/a | `number` | `5` | no |
| <a name="input_pod_restarts_docs"></a> [pod\_restarts\_docs](#input\_pod\_restarts\_docs) | n/a | `string` | `""` | no |
| <a name="input_pod_restarts_enabled"></a> [pod\_restarts\_enabled](#input\_pod\_restarts\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_pod_restarts_evaluation_period"></a> [pod\_restarts\_evaluation\_period](#input\_pod\_restarts\_evaluation\_period) | n/a | `string` | `"last_10m"` | no |
| <a name="input_pod_restarts_filter_override"></a> [pod\_restarts\_filter\_override](#input\_pod\_restarts\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_pod_restarts_no_data_timeframe"></a> [pod\_restarts\_no\_data\_timeframe](#input\_pod\_restarts\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_pod_restarts_note"></a> [pod\_restarts\_note](#input\_pod\_restarts\_note) | n/a | `string` | `""` | no |
| <a name="input_pod_restarts_notify_no_data"></a> [pod\_restarts\_notify\_no\_data](#input\_pod\_restarts\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_pod_restarts_ok_threshold"></a> [pod\_restarts\_ok\_threshold](#input\_pod\_restarts\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_pod_restarts_priority"></a> [pod\_restarts\_priority](#input\_pod\_restarts\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_pod_restarts_warning"></a> [pod\_restarts\_warning](#input\_pod\_restarts\_warning) | n/a | `number` | `3` | no |
| <a name="input_replicaset_incomplete_alerting_enabled"></a> [replicaset\_incomplete\_alerting\_enabled](#input\_replicaset\_incomplete\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_replicaset_incomplete_critical"></a> [replicaset\_incomplete\_critical](#input\_replicaset\_incomplete\_critical) | alert is raised when (desired - running) > replicaset\_incomplete\_critical | `number` | `0` | no |
| <a name="input_replicaset_incomplete_docs"></a> [replicaset\_incomplete\_docs](#input\_replicaset\_incomplete\_docs) | n/a | `string` | `"In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when (desired - running) > 0"` | no |
| <a name="input_replicaset_incomplete_enabled"></a> [replicaset\_incomplete\_enabled](#input\_replicaset\_incomplete\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_replicaset_incomplete_evaluation_period"></a> [replicaset\_incomplete\_evaluation\_period](#input\_replicaset\_incomplete\_evaluation\_period) | n/a | `string` | `"last_15m"` | no |
| <a name="input_replicaset_incomplete_filter_override"></a> [replicaset\_incomplete\_filter\_override](#input\_replicaset\_incomplete\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_replicaset_incomplete_no_data_timeframe"></a> [replicaset\_incomplete\_no\_data\_timeframe](#input\_replicaset\_incomplete\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_replicaset_incomplete_note"></a> [replicaset\_incomplete\_note](#input\_replicaset\_incomplete\_note) | n/a | `string` | `"There's also a monitor defined for when the replicaset is completely unavailable"` | no |
| <a name="input_replicaset_incomplete_notify_no_data"></a> [replicaset\_incomplete\_notify\_no\_data](#input\_replicaset\_incomplete\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_replicaset_incomplete_ok_threshold"></a> [replicaset\_incomplete\_ok\_threshold](#input\_replicaset\_incomplete\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_replicaset_incomplete_priority"></a> [replicaset\_incomplete\_priority](#input\_replicaset\_incomplete\_priority) | Number from 1 (high) to 5 (low). | `number` | `3` | no |
| <a name="input_replicaset_unavailable_alerting_enabled"></a> [replicaset\_unavailable\_alerting\_enabled](#input\_replicaset\_unavailable\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_replicaset_unavailable_critical"></a> [replicaset\_unavailable\_critical](#input\_replicaset\_unavailable\_critical) | alert is raised when (desired - running) == 0 | `number` | `0` | no |
| <a name="input_replicaset_unavailable_docs"></a> [replicaset\_unavailable\_docs](#input\_replicaset\_unavailable\_docs) | n/a | `string` | `"In kubernetes a Replicaset is responsible for making sure a specific number of pods runs. An example for a reason when that's not is the case, is when the image cannot be pulled, the pod fails to initialize or no resources are available on the cluster\nThis alert is raised when running == 0 and desired > 1"` | no |
| <a name="input_replicaset_unavailable_enabled"></a> [replicaset\_unavailable\_enabled](#input\_replicaset\_unavailable\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_replicaset_unavailable_evaluation_period"></a> [replicaset\_unavailable\_evaluation\_period](#input\_replicaset\_unavailable\_evaluation\_period) | n/a | `string` | `"last_5m"` | no |
| <a name="input_replicaset_unavailable_filter_override"></a> [replicaset\_unavailable\_filter\_override](#input\_replicaset\_unavailable\_filter\_override) | n/a | `string` | `""` | no |
| <a name="input_replicaset_unavailable_no_data_timeframe"></a> [replicaset\_unavailable\_no\_data\_timeframe](#input\_replicaset\_unavailable\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_replicaset_unavailable_note"></a> [replicaset\_unavailable\_note](#input\_replicaset\_unavailable\_note) | n/a | `string` | `"There's also a monitor defined for when the replicaset is only partially available"` | no |
| <a name="input_replicaset_unavailable_notify_no_data"></a> [replicaset\_unavailable\_notify\_no\_data](#input\_replicaset\_unavailable\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_replicaset_unavailable_ok_threshold"></a> [replicaset\_unavailable\_ok\_threshold](#input\_replicaset\_unavailable\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_replicaset_unavailable_priority"></a> [replicaset\_unavailable\_priority](#input\_replicaset\_unavailable\_priority) | Number from 1 (high) to 5 (low). | `number` | `2` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | `"Kubernetes"` | no |
| <a name="input_state_metrics_monitoring"></a> [state\_metrics\_monitoring](#input\_state\_metrics\_monitoring) | n/a | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->