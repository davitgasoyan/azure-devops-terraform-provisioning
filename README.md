# Azure DevOps Project & Pipeline Provisioning with Terraform

This repository contains Terraform code to provision an **Azure DevOps project**, a **Git repository**, and a **build pipeline** with a pipeline YAML file.

> **Note:** All sensitive values (PAT, organization URL) are placeholders in this repo. Replace them with your own credentials before running.

---

## Features

- Create a new Azure DevOps project.
- Create a Git repository inside the project.
- Create a build pipeline linked to a pipeline YAML file.
- Upload the pipeline YAML file to the repository.
- Output the repository clone URL for easy use.

---

## Prerequisites

- Terraform v1.6+ installed.
- Azure DevOps organization.
- Personal Access Token (PAT) with permissions to create projects, repos, and pipelines.
- A pipeline YAML file located at `repo/azure-pipelines.yml`.

---

## Setup

1. **Clone this repository:**

```bash
git clone https://github.com/davitgasoyan/azure-devops-terraform-provisioning
cd azure-devops-terraform-provisioning
```

2. **Fill terraform.tfvars with your credentials:**

