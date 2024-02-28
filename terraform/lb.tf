resource "yandex_lb_network_load_balancer" "reddit_balancer" {
  name                = "reddit-balancer"
#  deletion_protection = "false"
  listener {
    name = "reddit-balancer"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {

    target_group_id = yandex_lb_target_group.app.id
    healthcheck {
      name = "app-check"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "app" {
  name = "reddit-target"
  dynamic "target" {
    for_each = range(var.reddit_instance_count)
    iterator = counter
    content {
      subnet_id = var.yc_subnet_id
      address   = yandex_compute_instance.app[counter.key].network_interface[0].ip_address
    }
  }
}
