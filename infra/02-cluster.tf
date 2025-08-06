resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
    #Standard_B2ms
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Test"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}





output "kube_host" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.host
  sensitive = true
}

output "kube_client_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
  sensitive = true
}

output "kube_client_key" {
  value     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
  sensitive = true
}

output "kube_cluster_ca_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
  sensitive = true
}