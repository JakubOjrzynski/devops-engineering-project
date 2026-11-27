variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-engineering"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "github_owner" {
  description = "GitHub organization or username owning the repository"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name used for deployments"
  type        = string
}
