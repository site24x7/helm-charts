# site24x7-operator

Helm chart for the **Site24x7 Kubernetes Operator** — automates the deployment and management of Site24x7 monitoring agents for infrastructure and application performance monitoring (APM) in Kubernetes clusters.

## Prerequisites

- Kubernetes 1.21+
- Helm 3.0+
- Cluster-admin privileges (required to install CRDs, ClusterRole, and ClusterRoleBinding)

## Site24x7 Operator Installation

Create the site24x7 namespace and secret generic key
```bash
kubectl create namespace site24x7 && kubectl create secret generic site24x7-agent --namespace site24x7 --from-literal=s247_device_key=<Site24x7LicenseKey>
```

Add Site24x7 repo

```bash
helm repo add site24x7 https://site24x7.github.io/helm-charts

helm repo update
```

Install SIte24x7 Operator

```bash
helm install site24x7-operator-release site24x7/site24x7-operator
```

Apply site24x7k8s custom resource configuration
```bash
kubectl apply -f site24x7k8s_resource.yaml
```

## Configuration

Key values that can be overridden:

| Parameter | Description | Default |
|---|---|---|
| `namespace` | Namespace to deploy the operator into | `site24x7` |
| `operator.operatorContainer.imageRef.repository` | Operator image repository | `site24x7/site24x7-operator` |
| `operator.operatorContainer.imageRef.tag` | Operator image tag | `v1.0.0` |
| `operator.operatorContainer.imageRef.pullPolicy` | Image pull policy | `IfNotPresent` |
| `operator.operatorContainer.imageRef.imagePullSecrets` | Image pull secrets | `[]` |
| `operator.applyPriorityClass` | Apply a priority class to the operator pod | `true` |
| `operator.applyDefaultTolerations` | Apply default tolerations to the operator pod | `true` |
| `openshift` | Enable OpenShift-specific configuration | `false` |
| `gkeAutoPilot` | Enable GKE Autopilot-specific configuration | `false` |

Override values at install time using `--set` or a custom values file:

```bash
helm install site24x7-operator-release site24x7/site24x7-operator \
  --set operator.operatorContainer.imageRef.tag=1.1.0 \
  --set openshift=true
```

## Uninstallation

```bash
helm uninstall site24x7-operator

kubectl delete namespace site24x7
```

## Helpful Links

- [Monitor your Kubernetes cluster using Site24x7 Operator](https://www.site24x7.com/help/apm/kubernetes-operator.html)
- [Migrate from standard Kubernetes infrastructure and APM monitoring to operator-based monitoring](https://www.site24x7.com/help/apm/migrate-to-kubernetes-operator.html)
- [Site24x7K8s Custom Resource configuration specifications](https://www.site24x7.com/help/apm/migrate-to-kubernetes-operator.html)