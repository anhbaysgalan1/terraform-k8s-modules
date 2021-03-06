variable "name" {}

variable "namespace" {
  default = null
}

variable "replicas" {
  default = 1
}

variable "ports" {
  default = [
    {
      name : "http"
      port : 80
    },
  ]
}

variable "image" {
  default = "registry.rebelsoft.com/corteza-server-system"
}

variable "overrides" {
  default = {}
}

variable "DB_DSN" {}

variable "AUTH_JWT_SECRET" {}