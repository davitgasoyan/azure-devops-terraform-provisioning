variable "azure_devops_pat" {
  description = "Personal Access Token"
  type        = string
  sensitive   = true
}

variable "azure_devops_org" {
  description = "Organization URL"
  type        = string
}

variable "azure_devops_project" {
  description = "Project name"
  type        = string
}