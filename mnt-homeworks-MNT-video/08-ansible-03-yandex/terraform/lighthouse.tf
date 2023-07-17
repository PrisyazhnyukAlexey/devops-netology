#создаем  ВМ
resource "yandex_compute_instance" "lighthouse" {
  name        = "lighthouse"
  platform_id = "standard-v1"
  count = 1

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd80le4b8gt2u33lvubr"
      type = "network-hdd"
      size = 15
    }   
  }

  metadata = {
   user-data = data.template_file.instance_userdata.rendered
   serial-port-enable = 1 
   ssh-keys = "root:${local.ssh_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}