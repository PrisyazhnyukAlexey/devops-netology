resource "yandex_compute_disk" "vm" {
  count = 3
  size = 1
  name = "disk-${count.index+1}"
}
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.vm[*].id
    content {
      disk_id = secondary_disk.value
    }
  }

  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_key
  }
}