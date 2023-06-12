output "all_vm" {
  value = [
 {
  "name" = yandex_compute_instance.storage[*].name
  "id"   = yandex_compute_instance.storage[*].id
  "fqdn" =  yandex_compute_instance.storage[*].fqdn
 },
 {
  "name" = yandex_compute_instance.web[*].name
  "id"   = yandex_compute_instance.web[*].id
  "fqdn" = yandex_compute_instance.web[*].fqdn
 },
 { for instance, vm in yandex_compute_instance.vm :
    instance => {
   "name" = vm.name
   "id" = vm.id
   "fqdn" = vm.fqdn
 }}

    ]
}
