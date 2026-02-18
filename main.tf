resource "azuredevops_project" "project" {
  name            = var.azure_devops_project
  description     = "Project created via Terraform"
  visibility      = "private"
  version_control = "Git"
}

resource "azuredevops_git_repository" "repo" {
  project_id = azuredevops_project.project.id
  name       = "${azuredevops_project.project.name}-repo"

  initialization {
    init_type = "Clean"
  }

  depends_on = [azuredevops_project.project]
}

resource "azuredevops_build_definition" "pipeline" {
  project_id = azuredevops_project.project.id
  name       = "My Build Pipeline"
  path       = "\\"

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repo.id
    branch_name = "refs/heads/master"
    yml_path    = "azure-pipelines.yml"
  }
  depends_on = [azuredevops_git_repository.repo]
}

resource "azuredevops_git_repository_file" "pipeline_yaml" {
  repository_id       = azuredevops_git_repository.repo.id
  file                = "azure-pipelines.yml"
  content             = file("repo/azure-pipelines.yml")
  branch              = "refs/heads/master"
  commit_message      = "Add pipeline YAML"
  overwrite_on_create = true

  depends_on = [azuredevops_git_repository.repo]
}

output "repo_clone_url" {
  description = "Repository URL"
  value       = azuredevops_git_repository.repo.remote_url
}
