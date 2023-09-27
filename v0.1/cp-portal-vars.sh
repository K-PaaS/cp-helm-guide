# COMMON VARIABLE (Please change the value of the variables below.)
K8S_MASTER_NODE_IP="{k8s master node public ip}"                          # Kubernetes Master Node Public IP
HOST_CLUSTER_IAAS_TYPE="{k8s cluster iaas type}"                          # Kubernetes Cluster IaaS Type (Please enter 'AWS' or 'OPENSTACK')
PROVIDER_TYPE="{container platform portal provider type}"                 # Container Platform Portal Provider Type (Please enter 'standalone' or 'service')
HOST_DOMAIN="{host domain}"                                               # Host Domain (e.g. xx.xxx.xxx.xx.nip.io)

# The belows are the default values.
# If you change the values below, there will be a problem with the deploy. Please keep the values.
# DEPLOYMENT CONFIG
NAMESPACE=(
"vault"
"harbor"
"mariadb"
"keycloak"
"cp-portal"
"rabbitmq"
"mongodb"
"redis"
)

CHART_NAME=(
"cp-vault"
"cp-harbor"
"cp-mariadb"
"cp-keycloak"
"cp-portal-resource"
"cp-portal-app"
"cp-rabbitmq"
"cp-mongodb"
"cp-redis"
)

IMAGE_NAME=(
"cp-portal-ui"
"cp-portal-api"
"cp-portal-common-api"
"cp-portal-metric-api"
"cp-portal-terraman"
"cp-portal-service-broker"
)

IMAGE_TAGS="latest"                                                                          # image tag
IMAGE_PULL_POLICY="Always"                                                                   # image pull policy
IMAGE_PULL_SECRET="cp-secret"                                                                # image pull secret
SERVICE_TYPE="ClusterIP"                                                                     # service type in kubernetes
SERVICE_PROTOCOL="TCP"                                                                       # service protocol in kubernetes

# K8S
K8S_CLUSTER_ADMIN="cp-cluster-admin"                                                         # kubernetes cluster-admin role resource name
K8S_CLUSTER_ADMIN_NAMESPACE="kube-system"                                                    # kubernetes cluster-admin role namespace
K8S_CLUSTER_API_SERVER="https://${K8S_MASTER_NODE_IP}:6443"                                  # kubernetes api server

# STORAGECLASS
PERSISTENT_STORAGE_CLASS_NAME="cp-storageclass"                                              # persistent storage class name

# INGRESS CONTROLLER
CP_DEFAULT_INGRESS_NAMESPACE="ingress-nginx"                                                 # container platform default ingress namespace
CP_DEFAULT_INGRESS_CLASS_NAME="nginx"                                                        # container platform default ingress name

# VAULT
VAULT_URL="http://vault.${HOST_DOMAIN}"                                                      # vault url
VAULT_ROLE_NAME="cp_role"                                                                    # vault role name

# HARBOR
REPOSITORY_URL="https://harbor.${HOST_DOMAIN}"                                               # harbor url
REPOSITORY_USERNAME="admin"                                                                  # harbor admin username (e.g. admin)
REPOSITORY_PASSWORD="Harbor12345"                                                            # harbor admin password (e.g. Harbor12345)
REPOSITORY_PROJECT_NAME="cp-portal-repository"                                               # harbor project name

# MARIADB
DATABASE_URL="cp-mariadb.mariadb.svc.cluster.local:3306"                                     # database url
DATABASE_USER_ID="cp-admin"                                                                  # database user name (e.g. cp-admin)
DATABASE_USER_PASSWORD="cpAdmin!12345"                                                       # database user password (e.g. cpAdmin!12345)
DATABASE_TERRAMAN_ID="terraman"                                                              # database user name (e.g. terraman)
DATABASE_TERRAMAN_PASSWORD="cpAdmin!12345"                                                   # database user name (e.g. cpAdmin!12345)

# KEYCLOAK
KEYCLOAK_URL="http://keycloak.${HOST_DOMAIN}"                                                # keycloak url (if apply TLS, https:// )
KEYCLOAK_DB_VENDOR="mariadb"                                                                 # keycloak database vendor
KEYCLOAK_DB_SCHEMA="keycloak"                                                                # keycloak database schema
KEYCLOAK_ADMIN_USERNAME="admin"                                                              # keycloak admin username (e.g. admin)
KEYCLOAK_ADMIN_PASSWORD="admin"                                                              # keycloak admin password (e.g. admin)
KEYCLOAK_SESSIONS_COUNT="2"                                                                  # keycloak sessions count
KEYCLOAK_LOG_LEVEL="INFO"                                                                    # keycloak log level
KEYCLOAK_CP_REALM="cp-realm"                                                                 # keycloak realm for container platform portal
KEYCLOAK_CP_CLIENT_ID="cp-client"                                                            # keycloak client id for container platform portal
KEYCLOAK_CP_CLIENT_SECRET="bfbc9f86-81f4-4307-b57e-c84e943a5bc5"                             # keycloak client secret for container platform portal
KEYCLOAK_INGRESS_TLS_ENABLED="false"                                                         # keycloak ingress tls enabled (if apply TLS, true)
KEYCLOAK_TLS_CERT_PATH="path/to/cert/file"                                                   # keycloak tls cert file path (if apply TLS, cert file path)
KEYCLOAK_TLS_KEY_PATH="path/to/key/file"                                                     # keycloak tls key file path (if apply TLS, key file path)
KEYCLOAK_TLS_SECRET="cp-keycloak-tls-secret"                                                 # keycloak tls secret name

# CP_PORTAL
CP_PORTAL_URL="http://portal.${HOST_DOMAIN}"                                                 # container platform portal url
CP_PORTAL_PROVIDER_TYPE="cp-portal-$PROVIDER_TYPE"                                           # container platform portal provider type
HOST_CLUSTER_NAME="host-cluster"                                                             # host cluster name
K8S_MASTER_HOST_KEY="master-host-key"                                                        # kubernetes master host key

# CP_SERVICE
CP_SERVICE_PIPELINE_NAMESPACE="cp-pipeline"                                                  # container platform service pipeline namespace
CP_SERVICE_SOURCE_CONTROL_NAMESPACE="cp-source-control"                                      # container platform service source control namespace

# Rabbitmq
RABBITMQ_USERNAME="admin"
RABBITMQ_PASSWORD="admin"
INGRESS_ENABLED="false"                                                                      # default=false / you can switch to "true" if you want to use it

# MONGODB
MONGODB_DATABASE_URL="cp-mongodb.mongodb.svc.cluster.local:27017"
MONGODB_USER_ID="cp-admin"
MONGODB_USER_PASSWORD="K-PaaS@2023"

# REDIS
REDIS_DATABASE_URL="cp-redis.redis.svc.cluster.local:6379"
REDIS_PASSWORD="K-PaaS@2023"
AUTO_SCALING="ture"                                                                      	# If you don't want to use it, you can change it to "false"
SENTINEL_ENABLE="true"	                                                                    # you can switch to "true" if you want to use it 
