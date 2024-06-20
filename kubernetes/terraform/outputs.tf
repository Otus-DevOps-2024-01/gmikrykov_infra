
output "external_ip_address_node" {
  value = { for i in range(var.node_instance_count) : "k8s-node-${i}" => yandex_vpc_address.node_vpc[i].external_ipv4_address[0].address }
}
output "external_ip_address_master" {
  value = yandex_vpc_address.master_vpc.external_ipv4_address[0].address
}
