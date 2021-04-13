resource "yandex_vpc_network" "network-dz3" {
  name = "LAN"
}


resource "yandex_vpc_subnet" "subnet-dz3" {
  name           = "SUBNET-LAN"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-dz3.id
  v4_cidr_blocks = ["192.168.100.0/24"]
}


