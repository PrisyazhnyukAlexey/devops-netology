resource "yandex_compute_instance" "private-vm" {
  name        = "private-vm"
  zone        = var.zone
  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private.id

  }

  metadata = {
    user-data = "#cloud-config\nusers:\n  - name: alex\n    groups: sudo\n    ssh-authorized-keys:\n      - ${file("~/.ssh/id_rsa.pub")} "
      }
  allow_stopping_for_update = true
}
