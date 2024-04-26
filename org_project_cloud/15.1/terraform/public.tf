resource "yandex_compute_instance" "nat" {
  name        = var.nat_instance_name
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
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
    ip_address = "192.168.10.254"
    
  }
metadata = {
  user-data = "${file("cloud-init.yaml")}"
}  
# metadata = {
#   user-data = "#cloud-config\nusers:\n  - name: alex\n    groups: sudo\n    shell: /bin/bash\n    sudo: 'ALL=(ALL) NOPASSWD:ALL'\n    ssh-authorized-keys:\n      - ${file("~/.ssh/id_rsa.pub")}\nwrite_files\n- path: /root/test\n  permissions: 0660\n  owner: root:root\n content: |\n      ${file("~/.ssh/id_rsa")}"
# } 
  allow_stopping_for_update = true  
}

