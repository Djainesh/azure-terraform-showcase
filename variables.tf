variable "project_name" {
  description = "Short name used as a prefix for all resource names"
  type        = string
  default     = "tfshowcase"

  validation {
    condition     = length(var.project_name) <= 20
    error_message = "project_name must be 20 characters or fewer."
  }
}

variable "location" {
  description = "Azure region to deploy into"
  type        = string
  default     = "centralindia"
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}