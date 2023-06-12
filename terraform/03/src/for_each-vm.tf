
resource "yandex_compute_instance" "vm" {
  depends_on = [yandex_compute_instance.web]
  for_each = {
    "mail" = {name = "main", cpu = 2, memory = 2, disk = 35},
    "web" = {name = "web", cpu = 4, memory = 4, disk = 50}
  }

  name        = each.key
  platform_id = "standard-v1"

  resources {
    cores  = each.value.cpu
    memory = each.value.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_key
  }
}