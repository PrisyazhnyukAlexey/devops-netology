output "network" {
  value  =  yandex_vpc_network.develop.id
}
output "subnet" {
  value = yandex_vpc_subnet.develop.*.id
}
