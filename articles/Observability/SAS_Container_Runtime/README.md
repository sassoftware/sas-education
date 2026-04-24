# SAS Container Runtime Observability Samples

This content relates to observability for SAS Container Runtime.

## Grafana Dashboard Example

The dashboard (`scr-dashboard.json`) has been provide as a sample to provide a Quick Start for monitoring SAS Container Runtime deployments on a Kubernetes cluster.

The following image shows the status overview, showing the running models and decisions.

![status-summary](/articles/Observability/images/scr-status-summary.png)

### Dashboard Usage Notes

For the dashboard to function it is expecting the SAS Container Runtime pods to have the following labels:

* **app.kubernetes.io/name**
* **app.kubernetes.io/component**

The above labels are not only used in the PromQL queries; the `app.kubernetes.io/component` label is also used to create a filtered list of namespaces.

While the dashboard endeavours to make the reporting independent of the pod names, there are queries that rely on regular expression matching using: `pod=~".*$model.*"`

This was necessary as not all metrics data includes the Kubernetes labels. However, it does require that the model name is part of the pod name. For example, qsreg1-scr-model or riskscore-model.

The **Node View** reporting assumes any nodes dedicated to running the SAS Container Runtime pods have the following label:

* **workload/class=models**

*Please note, the dashboard is provided as a sample and has not been put through comprehensive validation testing. It was developed for the SAS Container Runtime workshop. For more information see: [SAS Container Runtime: Architecture and Deployment on Azure Cloud](https://learn.sas.com/course/view.php?id=6390)*

## SAS Communities Articles

See the following Communities posts:

* [SAS Container Runtime Observability Part 1](https://communities.sas.com/t5/SAS-Communities-Library/SAS-Container-Runtime-Observability/ta-p/984344)
* SAS Container Runtime Observability Part 2

    Part 2 and the Grafana dashboard example will be available shortly.
