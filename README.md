# Terraform Project Documentation

## 📁 Project Structure

```
.
├── acr.tf
├── gke.tf
├── local.tf
├── modules
│   ├── gke-cluster-standard
│   ├── gke-nodepool
│   ├── net-address
│   ├── net-cloudnat
│   ├── net-vpc
│   ├── net-vpc-firewall
│   └── workload-identity
├── networking.tf
├── provider.tf
├── terraform.tf
└── workload_identity.tf
```

---

## 📄 File & Module Overview

### **Root Terraform Files**

| File                     | Description                                                                          |
| ------------------------ | ------------------------------------------------------------------------------------ |
| **provider.tf**          | Defines Google Cloud provider configuration, authentication, and required providers. |
| **terraform.tf**         | Backend settings, Terraform version, and provider requirements.                      |
| **local.tf**             | Stores computed local variables used across the configuration.                       |
| **networking.tf**        | Declares VPC, subnets, firewall rules, NAT gateway, and IP ranges.                   |
| **gke.tf**               | Configures the GKE cluster and node pools using included modules.                    |
| **acr.tf**               | Creates Artifact Registry repositories (Docker, Helm, etc.).                         |
| **workload_identity.tf** | Manages Workload Identity bindings between GCP and GitHub Actions.      |

---

## 📦 Modules

### **modules/gke-cluster-standard**

Reusable GKE standard cluster module:

* Cluster creation
* Networking configuration
* Monitoring & logging
* Release channels

### **modules/gke-nodepool**

Reusable node pool module:

* Machine types
* Autoscaling configuration
* Node labels & taints

### **modules/net-vpc**

Creates VPC:

* Custom mode
* Subnets management

### **modules/net-vpc-firewall**

Defines firewall rules:

* SSH/IAP
* Health checks
* Internal traffic

### **modules/net-cloudnat**

Configures Cloud NAT for outbound internet access.

### **modules/net-address**

Reserves static external/internal IP addresses.

### **modules/workload-identity**

Manages:

* GCP SA
* IAM bindings
* Workload Identity federation

---

## 🚀 Application Deployment Screenshots

### **1. Application Deployment on GKE**

*Add screenshots showing:*

* Kubernetes manifests apply output
* Pods running
* Services and load balancers
* Ingress configuration
* Application UI running in browser

**Screenshot Placeholder:**

```
![App Deployment Screenshot](screenshots/app_deployment.png)
```

---

## 🏗️ Infrastructure Deployment Screenshots

### **2. Terraform Infra Deployment**

*Add screenshots showing:*

* Terraform plan
* Terraform apply
* GCP Console resources after deployment
* GKE dashboard
* VPC, subnets, NAT, Artifact Registry, node pools

**Screenshot Placeholder:**

```
![Infrastructure Deployment Screenshot](screenshots/infra_deployment.png)
```

---

## 📌 Notes

* Ensure screenshots are placed in a folder named **`screenshots/`** at the root of the repo.
* Update the paths above if you store them elsewhere.

---

## ✔️ Version Control Recommendation

Add the following to `.gitignore`:

```
.terraform/
.terraform.lock.hcl
*.tfstate
*.tfstate.backup
secret.auto.tfvars
```

---

If you'd like, I can also:
✅ Add a diagram section
✅ Generate architecture diagrams
✅ Add usage instructions (init/plan/apply)
✅ Add module-level documentation

Just tell me!
