resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  frontIPs = yandex_compute_instance.frontend.*.network_interface.0.nat_ip_address,
  frontIPsInt = yandex_compute_instance.frontend.*.network_interface.0.ip_address,
  backIPs = yandex_compute_instance.backend.*.network_interface.0.nat_ip_address,
  dataIPs = yandex_compute_instance.database.*.network_interface.0.nat_ip_address,
  backIPsInt = yandex_compute_instance.backend.*.network_interface.0.ip_address,
  dataIPsInt = yandex_compute_instance.database.*.network_interface.0.ip_address,
 }
 )
 filename = "../Ansible/inventory"
}
