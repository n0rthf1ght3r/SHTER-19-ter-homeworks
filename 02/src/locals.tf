locals {
  project  = "netology"
  env      = var.vpc_name # "develop"
  platform = "platform"
  web_role = "web"
  db_role  = "db"

  # Получим букву зоны из "ru-central1-a/b"
  zone_web = replace(var.default_zone, "ru-central1-", "")
  zone_db  = replace(var.vm_db_zone, "ru-central1-", "")

  # Имена ВМ
  vm_web_name = "${local.project}-${local.env}-${local.platform}-${local.web_role}-${local.zone_web}"
  vm_db_name  = "${local.project}-${local.env}-${local.platform}-${local.db_role}-${local.zone_db}"
}
