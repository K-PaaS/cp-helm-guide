# Helm Chart Utilization Guide

### Purpose

This guide explains how to manage images and Helm Charts using Harbor provided by the K-PaaS Container Platform and easily configure cluster resources tailored to specific instances.

### Prerequisite

This guide is written based on an environment where the Container Platform Portal has been deployed.

### `cp-helm` Directory Structure
```console
$cd $HOME/cp-helm ls -l
├── charts                                         # Helm Charts file is located / compressed in *.tgz file format
└── cp-rabbitmq.tgz  
├── script                                         # Where Deployment-related variables and script file are located
│   ├── cp-helm-rabbitmq-vars.sh
│   └── deploy-cp-helm.sh
└── values_orig
    └── cp-rabbitmq.yaml                           # Where Helm Charts values.yaml file is located
```

## Chart Utilization 1. Packaging
- Move to Chart Directory
    ```console
    $cd $HOME/charts/{CHART_NAME}
  ```
- Verify the Helm Chart file components for packaging. </br>
_ex) cp-rabbitmq_
    ```console
    $cd $HOME/charts/cp-rabbitmq$ ls -l
    ├──Chart.lock
    ├──charts/
    ├──Chart.yaml
    ├──.helmignore
    ├──README.md
    ├──templates/
    ├──values.schema.json
    └──values.yaml
    ```
-  Package Helm Chart
    ```console
    $helm package ${CHART_NAME}
    ```
    _ex) cp-rabbitmq Helm Chart packaging_
    ```console
    $helm package cp-rabbitmq
    $ls -l
    cp-rabbitmq/  cp-rabbitmq.tgz
    ```

## Chart Utilization 2. Modifying values.yaml
- Modify the values.yaml file of Helm Chart.
    - Copy values.yaml of Chart to values_orig directory
        ```console
        $cp $HOME/cp-helm/charts/cp-rabbitmq/values.yaml $HOME/cp-helm/values_origin
        ```
    - Check the copied file
        ```console
        $cd $HOME/cp-helm/values_orig ls -l
        values.yaml
        ```
    - vchange the name of values.yaml file to {CHART_NAME}.yaml
        ```console
        $mv values.yaml cp-rabbitmq.yaml
        ```
    - Open and edit the cp-rabbitmq.yaml file.
        - This file allows you to replace the Helm Chart's environment variables with custom values.</br>
        _ex) RabbitMQ(cp-rabbitmq.yaml): It is configuring the user's username and password, and whether to use ingress._
        ```console
        $vi cp-rabbitmq.yaml
        ```
        ```yaml
        auth:
        ## @param auth.username RabbitMQ application username
        ## ref: https://github.com/bitnami/containers/tree/main/bitnami/rabbitmq#environment-variables
        ##
        username: "admin"
        ## @param auth.password RabbitMQ application password
        ## ref: https://github.com/bitnami/containers/tree/main/bitnami/rabbitmq#environment-variables
        ##
        password: "admin"
        ...
        ingress:
        ## @param ingress.enabled Enable ingress resource for Management console
        ##
        enabled: "false"
        ...
        ```

## Chart Utilization 3. Modify Variables
- Move to the script directory.
```console
$cd $HOME/cp-helm/script/cp-helm-rabbitmq-vars.sh    
```
- Check the informations needed for deployment and set variables
```sh
# COMMON VARIABLE
CHART_NAME="Enter the name of the chart"                                         # input name of the packaged .tgz
NAMESPACE="Enter namespace name to be deployed"                                  # input namespace to deploy

## ex)
## CHART_NAME="cp-rabbitmq"
## NAMESPACE="rabbitmq"

# HARBOR INFO
HARBOR_REPOSITORY_URL="Enter the harbor repository url"                          # input harbor repository url set in cp-portal-vars
HARBOR_REPOSITORY_USERNAME="Enter the harbor repository username"                # input username of harbor repository set in cp-portal-vars
HARBOR_REPOSITORY_PASSWORD="Enter the harbor repository password"                # input password of harbor repository set in cp-portal-vars 

# DEFAULT VARIABLE FOR DEPLOYMENT
IMAGE_TAGS="latest"                                                              # image tag
IMAGE_PULL_POLICY="Always"                                                       # image pull policy
IMAGE_PULL_SECRET="cp-secret"                                                    # image pull secret
SERVICE_TYPE="ClusterIP"                                                         # service type in kubernetes
SERVICE_PROTOCOL="TCP"                                                           # service protocol in kubernetes
```

## Chart Utilization 4. Deployment
```console
$cd $HOME/cp-helm/script/deploy-cp-helm.sh
$chmod +x deploy-cp-helm.sh
$./deploy-cp-helm.sh
```
</br>

### In conclusion
Through this guide, you have learned how to configure and deploy Helm Charts. Using the cp-helm-${CHART_NAME}-vars.sh script, you can store and deploy images through the Harbor Repository. Note that when generating the filename, you must specify {CHART_NAME} accurately.


