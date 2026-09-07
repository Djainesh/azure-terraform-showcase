variable "vm_name"             { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id"           { type = string }
variable "admin_username"      { type = string }

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v7"
  description = "B-series unavailable on this subscription; using unrestricted D-series instead"
}