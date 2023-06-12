resource "local_file" "host_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    { web = yandex_compute_instance.web
      vm = yandex_compute_instance.vm
      storage = yandex_compute_instance.storage[*]

    })
  filename = "${abspath(path.module)}/hosts.cfg"
}