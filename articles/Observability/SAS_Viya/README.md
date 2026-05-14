# SAS Viya Observability Samples

This content relates to observability for SAS Viya.

The dashboard examples provided here are additional to the dashboards provided by the [SAS Viya Monitoring for Kubernetes](https://github.com/sassoftware/viya4-monitoring-kubernetes) GitHub project. It is not intended to replace this functionality.

## SAS Viya Overview Dashboard

The SAS Viya Overview dashboard (`sas-viya-overview.json`) has been developed to provide summary views of the SAS Viya deployments, focusing on several key administration and deployment metrics.

The following images are from monitoring a SAS Viya deployment starting. The first image shows the "prod" deployment starting, it is showing the very early stages of the SAS Viya start-up.

![sv-dashboard-startup](/articles/Observability/images/SV_Dashboard-startup1-v2.png)

A bit later in the start-up process.

![sv-dashboard-startup2](/articles/Observability/images/SV_Dashboard-startup-v2.png)

And once the deployment had fully started.

![sv-dashboard-running](/articles/Observability/images/SV_Dashboard-running-v2.png)

The deployment was not using the SAS Deployment Operator. Which is why you see 'Not Detected' in the 'Deployment Operator Status' panel.

### Dashboard Notes

The cadence information shown in the image above has a dependency on labels being applied to the SAS Viya namespace. This is required as the cadence data is stored in a ConfigMap. The ConfigMap data is not natively collected.

It should be noted that this information is only available once the SAS Viya deployment is underway.

* The following can be used as a command template to apply the required labels.

    ```sh
    # Get the metadata pod name
    NS=viya_namespace
    pod=$(kubectl -n ${NS} get cm -l orchestration.sas.com/lifecycle=metadata | grep sas-deployment-metadata | awk '{print $1}')
    # Get metadata
    IFS='|' read -r SHORT_NAME VERSION RELEASE <<< "$(
    kubectl -n "${NS}" get cm "${pod}" \
        -o jsonpath='{.data.SAS_CADENCE_DISPLAY_SHORT_NAME}{"|"}{.data.SAS_CADENCE_VERSION}{"|"}{.data.SAS_CADENCE_RELEASE}'
    )"
    # Remove any spaces from the short name
    CNAME=${SHORT_NAME// /_}

    # Add labels
    kubectl label namespace ${NS} sas_cadence_name="${CNAME}" --overwrite
    kubectl label namespace ${NS} sas_cadence_version="${VERSION}" --overwrite
    kubectl label namespace ${NS} sas_cadence_release="${RELEASE}" --overwrite
    ```

Once the labels have been applied the cadence information will be displayed in the dashboard.

#### Dashboard variables

The dashboard uses a filtered list of namespaces. The `$namespace` variable uses a query that only lists namespaces that have SAS Viya deployments.

#### Using a vanilla Grafana / Prometheus deployment

While the dashboard can be used with any Grafana/Prometheus deployment, the CAS session reporting has a dependency of the 'SAS Viya Monitoring for Kubernetes' monitors being deployed to the SAS Viya namespace.

## SAS Communities Articles

See the following Communities post:

* [Building a Grafana dashboard to monitor SAS Viya](https://communities.sas.com/t5/SAS-Communities-Library/Building-a-Grafana-dashboard-to-monitor-SAS-Viya/ta-p/987954)