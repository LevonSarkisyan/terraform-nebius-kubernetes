terraform {
  required_version = ">= 1.0.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.8"
    }

    random = {
      source  = "hashicorp/random"
      version = "> 3.3"
    }
  }
}

provider "yandex" {
  endpoint = "api.nemax.nebius.cloud:443"
  folder_id = "bje61g15o6gcnphf5v2r"

}

data "yandex_client_config" "client" {}

data "yandex_kubernetes_cluster" "kubernetes" {
  name = yandex_kubernetes_cluster.kube_cluster.name
}
