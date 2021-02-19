resource "azurerm_kubernetes_cluster" "azure-k8s" {
  name                = "en-${var.env}-aks"
  location            = "${var.location}"
  dns_prefix          = "en${var.env}aks"
  resource_group_name = "${var.resource_group_name}"

  linux_profile {
    admin_username = "${var.os_username}"

    ssh_key {
      key_data = file("~/.ssh/azure-${var.env}.pub")
    }
  }

  addon_profile {
    kube_dashboard {
      enabled = "true"
    }
    oms_agent {
      enabled = true
      log_analytics_workspace_id = "${var.log_analytics_workspace_id}"
    }
  }

  default_node_pool {
    name            = "k8sagentpool"
    vm_size         = "${var.agent_pool_vmsize}"
    os_disk_size_gb = 30
    # Required for advanced networking
    vnet_subnet_id = "${var.vnet_id}"
    enable_auto_scaling = "true"
    max_count = "${var.agent_pool_count}"
    min_count = "${var.min_count}"
    node_count = "${var.min_count}"
    availability_zones  = [1, 2, 3]
    type = "VirtualMachineScaleSets"

  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }
  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }
  # If you're using AutoScaling, you may wish to use Terraform's ignore_changes functionality to ignore changes to the node_count field.
  lifecycle {
    ignore_changes = [default_node_pool["node_count"]]
  }

}