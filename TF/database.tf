resource "yandex_compute_instance" "database" {

  count = 1
  name = "database-${count.index}"

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
    subnet_id = yandex_vpc_subnet.subnet-dz3.id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    type        = "ssh"
    user        = "debian"
    private_key = file("~/.ssh/id_rsa")
    host        = self.network_interface.0.nat_ip_address
  }

}


output "internal_ip_address_database" {
  value = yandex_compute_instance.database.*.network_interface.0.ip_address
}


output "external_ip_address_database" {
  value = yandex_compute_instance.database.*.network_interface.0.nat_ip_address
}
