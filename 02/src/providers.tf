terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.124.0"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  cloud_id                 = "b1g3qbsgri9ct1gdgpmt"
  folder_id                = "b1g7j9h6bjkteg3c776l"
  service_account_key_file = file("/authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}

# You can set TF_LOG to one of the log levels (in order of decreasing verbosity) TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs.
# export TF_LOG=DEBUG
