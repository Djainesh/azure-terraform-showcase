variable "location" {
  description = "azure region"
  type        = string
  default     = "East US"

}
variable "subnets" {
  description = "Map of subnet name to address prefix"
  type        = map(string)
  default = {
    web = "10.0.1.0/24"
    app = "10.0.2.0/24"
    db  = "10.0.3.0/24"
  }
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}