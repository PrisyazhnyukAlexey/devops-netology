
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./modules | n/a |
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | n/a | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQCVt+GkFjKYWhvuc6G/grqnrXN6t73OduIXqgq8nmkyDki45NUaEkvL5yRq9TjjxiRUciKuLyeiV7MBwZdLmZffiLCiLgIply0NRyl0xt2dSxnYqPF8QT3dMX8Y8AIS63ixCN3A/iK7OEl5TiNEBpI8LkhDD6dydX9tcmKvHD5jBFvm9NveGSylts/WQMeLcLaVGbtHIgqQCFROiJ8jCQ0K8l1Bii+3eL/+ktASMM6rAIdSCMS/slD41F40cQH9MdDaNQXBoRA5TVpywompDX3XqKUSr4czhE3nmQyd3NVmVjcCwANh6gVs5NyQHXkxOxGIhp5njnQZObTRd6YazNEUzIlcPnRvN31fG66KqCRsv7KwmGgypW6CaMmpRIuvY0HOKsfENEblD4nrsD6pya0KJfj+xO6eV6lqxTuzHro+zX0jQy/LcyCJjzMPI4I/OkLqSaTTxaEhOmTkfctammx1RhRtskotWu5xlubA0QjfKMGAdYfX18saBBaN7VnSc= root@node1"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |

## Outputs
