###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQCVt+GkFjKYWhvuc6G/grqnrXN6t73OduIXqgq8nmkyDki45NUaEkvL5yRq9TjjxiRUciKuLyeiV7MBwZdLmZffiLCiLgIply0NRyl0xt2dSxnYqPF8QT3dMX8Y8AIS63ixCN3A/iK7OEl5TiNEBpI8LkhDD6dydX9tcmKvHD5jBFvm9NveGSylts/WQMeLcLaVGbtHIgqQCFROiJ8jCQ0K8l1Bii+3eL/+ktASMM6rAIdSCMS/slD41F40cQH9MdDaNQXBoRA5TVpywompDX3XqKUSr4czhE3nmQyd3NVmVjcCwANh6gVs5NyQHXkxOxGIhp5njnQZObTRd6YazNEUzIlcPnRvN31fG66KqCRsv7KwmGgypW6CaMmpRIuvY0HOKsfENEblD4nrsD6pya0KJfj+xO6eV6lqxTuzHro+zX0jQy/LcyCJjzMPI4I/OkLqSaTTxaEhOmTkfctammx1RhRtskotWu5xlubA0QjfKMGAdYfX18saBBaN7VnSc= root@node1"
}
