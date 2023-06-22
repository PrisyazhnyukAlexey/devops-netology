terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"


  backend "s3" {
  endpoint = "storage.yandexcloud.net"
  bucket = "tfstate-2002"
  region = "ru-central1"
  key = "terraform.tfstate"
  skip_region_validation = true
  skip_credentials_validation = true

  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g2oimdo0tcbkf2e6kd/etnpm71ehn81mjbq6k8k"
  dynamodb_table = "tflock-develop"
}
}
provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}


#создаем облачную сеть
module "network" {
  source = "./modules"
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.network.network
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = module.network.subnet
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

   vars = {
    username = "ubuntu"
    ssh_public_key = var.public_key
}
}
