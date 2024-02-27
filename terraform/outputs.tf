output "external_ip_address_app" {
  value = { for i in range(var.reddit_instance_count) : "reddit-app-${i}" => yandex_vpc_address.app_vpc[i].external_ipv4_address[0].address }
}
