data "template_file" "instance_userdata" {
  template = file("linux.tpl")
  vars = {
    env        = "perf"
    username   = "root"
    ssh_public = file("~/.ssh/id_rsa.pub")
  }
}
data "yandex_compute_image" "centos" {
  family = "centos-7"
}
