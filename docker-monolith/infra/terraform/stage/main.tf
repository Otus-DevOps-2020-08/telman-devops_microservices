provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source = "../modules/app"
  public_key_path = var.public_key_path
  subnet_id       = var.subnet_id
  instance_count = 1
  app_disk_image  = "fd8odlihkbqfh78g1qgt"
}