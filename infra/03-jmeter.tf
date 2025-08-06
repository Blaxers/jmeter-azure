provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.example.kube_config.0.host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "jmeter_slave" {
  name             = "jmeter-slave"
  chart            = "${path.module}/../k8s/jmeter-slave"
  namespace        = "jmeter"
  create_namespace = true
  values = [
    file("${path.module}/../k8s/jmeter-slave/values.yaml")
  ]

  # Dodaj jawną zależność od klastra
  depends_on = [azurerm_kubernetes_cluster.example]
}