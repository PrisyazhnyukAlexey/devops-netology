terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}



#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

#считываем данные об образе ОС
data "yandex_compute_image" "ubuntu-2004-lts" {
#  family = "ubuntu-2004-lts"
  family = "centos-7"
}

#создаем 2 идентичные ВМ
resource "yandex_compute_instance" "example" {
  name        = "clickhouse"
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
#   serial-port-enable = 1 
#   ssh-keys = "root:${local.ssh_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}


resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { webservers =  yandex_compute_instance.example   
      vector = yandex_compute_instance.vector
      lighthouse = yandex_compute_instance.lighthouse
    }  )

  filename = "${abspath(path.module)}/hosts.yml"
}
resource "local_file" "vector" {
  content = templatefile("${path.module}/vector.tftpl",

    { webservers =  yandex_compute_instance.example   
      vector = yandex_compute_instance.vector
      lighthouse = yandex_compute_instance.lighthouse
    }  )

  filename = "${abspath(path.module)}/ansible/group_vars/vector/vector.yml"
}


resource "null_resource" "web_hosts_provision" {
#Ждем создания инстанса
depends_on = [yandex_compute_instance.example]

#Добавление ПРИВАТНОГО ssh ключа в ssh-agent
#  provisioner "local-exec" {
#    command = "cat ~/.ssh/id_rsa.pub | ssh-add -"
#  }

#Костыль!!! Даем ВМ время на первый запуск. Лучше выполнить это через wait_for port 22 на стороне ansible
provisioner "local-exec" {
   command = "sleep 30"
 }

#Запуск ansible-playbook
 provisioner "local-exec" {                  
   command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.yml /home/aloha/Desktop/devops-netology/mnt-homeworks-MNT-video/08-ansible-03-yandex/ansible/site.yml"
   on_failure = continue #Продолжить выполнение terraform pipeline в случае ошибок
   environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
    #срабатывание триггера при изменении переменных
 }
   triggers = {  
     always_run         = "${timestamp()}" #всегда т.к. дата и время постоянно изменяются
     playbook_src_hash  = file("${abspath(path.module)}/ansible/site.yml") # при изменении содержимого playbook файла
     ssh_public_key     = var.public_key # при изменении переменной
   }

}
