data "yandex_client_config" "client" {}

resource "helm_release" "descheduler" {
  name       = "helm-descheduler"
  chart      = "../../helm-descheduler"
  namespace = "descheduler"
  create_namespace = true
  values = [
    "${file("../../helm-descheduler/values-my.yaml")}"
  ]
}

provider "helm" {
    kubernetes {
      host                   = module.kube.external_v4_endpoint
      cluster_ca_certificate = module.kube.cluster_ca_certificate
      token                  = data.yandex_client_config.client.iam_token
    }
}