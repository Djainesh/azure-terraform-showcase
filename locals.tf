locals {
  # Reused naming prefix - every resource in this project can build its name from this
  name_prefix = "${var.project_name}-${var.environment}"

  # Common tags applied consistently across every resource
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}