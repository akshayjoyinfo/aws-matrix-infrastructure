variable "env" {
  description = "Env dev, test, preprod, prod"
  type        = string
  default     = null
}

variable "location-prefix" {
  description = "use1, usw1"
  type        = string
  default     = null
}

variable "enm_bucket_names" {
  type = list
  default = ["carrier-bookings", "cargo-stuffings", "shipping-instructions", "carrier-events"]
}