resource "yandex_compute_instance" "manager" {
  count = 3

  name        = web-${count.index}
  hostname    = web-${count.index}
  description = web-${count.index}
  folder_id   = var.folder_id
  zone        = var.zone
  platform_id = "standard-v2"

  allow_stopping_for_update = true

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2004.id
      size     = 30
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = var.subnet
    nat                = true
  }

  metadata = {
    user-data = data.template_file.instance_userdata.rendered
  }
}
