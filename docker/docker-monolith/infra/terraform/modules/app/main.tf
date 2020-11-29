resource "yandex_compute_instance" "app" {
  count = var.instance_count
  name = "docker-machine-${count.index + 1}"

  labels = {
    tags = "docker-machine"
  }

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    //    subnet_id = yandex_vpc_subnet.app-subnet.id
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
