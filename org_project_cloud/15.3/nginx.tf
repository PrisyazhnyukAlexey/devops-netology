# //Create network
# resource "yandex_vpc_network" "network-nginx" {
#   name = "net"
# }
# //Create subnet
# resource "yandex_vpc_subnet" "subnet-public_nginx" {
#   name           = "public_subnet_nginx"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.network-nginx.id
#   v4_cidr_blocks = ["192.168.100.0/24"]
# }

# // Create service account
# resource "yandex_iam_service_account" "service-account-ig" {
#     name      = "service-account-ig"
# }

# // Grant permissions
# resource "yandex_resourcemanager_folder_iam_member" "service-editor" {
#     folder_id = var.folder_id
#     role      = "editor"
#     member    = "serviceAccount:${yandex_iam_service_account.service-account-ig.id}"
# }

# // Create instance group
# resource "yandex_compute_instance_group" "nginx-1" {
#     name               = "fixed-ig-with-balancer"
#     folder_id          = var.folder_id
#     service_account_id = yandex_iam_service_account.sa-ig.id

#     instance_template {
#         resources {
#             cores  = 2
#             memory = 1
#             core_fraction = 20
#         }
#         boot_disk {
#             initialize_params {
#                 image_id = "fd827b91d99psvq5fjit"
#             }
#         }
#         network_interface {
#             network_id  = yandex_vpc_network.network-nginx.id
#             subnet_ids  = [yandex_vpc_subnet.subnet-public_nginx.id]
#             nat         = true
#         }
#         scheduling_policy {
#             preemptible = true  // Прерываемая
#         }
#         metadata = {
#             ssh-keys   = "ubuntu:${file("/root/.ssh/id_rsa.pub")}"
#             user-data  = <<EOF
# #!/bin/bash
# apt install httpd -y
# cd /var/www/html
# echo '<html><img src="http://${yandex_storage_bucket.netology-bucket.bucket_domain_name}/test.jpg"/></html>' > index.html
# service httpd start
# EOF
#       }
#    }

#     scale_policy {
#         fixed_scale {
#             size = 3
#         }
#     }

#     allocation_policy {
#         zones = ["ru-central1-a"]
#     }

#     deploy_policy {
#         max_unavailable  = 1
#         max_creating     = 3
#         max_expansion    = 1
#         max_deleting     = 1
#         startup_duration = 3
#     }

#      health_check {
#         http_options {
#             port    = 80
#             path    = "/"
#         }
#     }

#     depends_on = [
#         yandex_storage_bucket.netology-bucket
#     ]

#     # load_balancer {
#     #     target_group_name = "target-group"
#     # }
# }