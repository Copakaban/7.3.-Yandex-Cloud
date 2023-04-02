terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.62.0"
    }
  }
  required_version = ">= 0.14"
}
provider "yandex" {
  token = "y0_AgAAAAA_P5JeAATuwQAAAADcgbLbL4FcwPGsTUK51oCZaaYDOTOr-dU"
  cloud_id = "b1g86c06jfc45daohlgn"
  folder_id = "b1g7p25m0jt3rdlenpmc"
  zone = var.region
}
resource "yandex_compute_instance" "vm1" {
  name        = "vm1"
  platform_id = "standard-v3"
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pqqqelpfjceogov30"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
  }
  metadata = {
    user-data = file("./meta.yaml")
  }
    scheduling_policy {
    preemptible = true
  }
}
resource "yandex_compute_instance" "vm2" {
  name        = "vm2"
  platform_id = "standard-v3"
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pqqqelpfjceogov30"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
  }
  metadata = {
    user-data = file("./meta.yaml")
  }
    scheduling_policy {
    preemptible = true
  }
}
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = "${yandex_vpc_network.network-1.id}"
}

output "internal_ip_address_vm1" {
  value = yandex_compute_instance.vm1.network_interface.0.ip_address
}
output "external_ip_address_vm1" {
  value = yandex_compute_instance.vm1.network_interface.0.nat_ip_address
}
output "internal_ip_address_vm2" { 
  value = "${yandex_compute_instance.vm2.network_interface.0.ip_address}"
}
output "external_ip_address_vm2" {
  value = "${yandex_compute_instance.vm2.network_interface.0.nat_ip_address}"
}
