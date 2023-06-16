#output "network" {
#  value = [
#    {
#     "vpc_id" =  yandex_vpc_network.develop.*.id
#     "vpc_subnet" = yandex_vpc_subnet.develop.*.id
#    }
#  ]
#}