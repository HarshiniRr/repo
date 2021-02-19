variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "env" {
  description = "Azure Environment Stg or PROD"
}

variable "resource_group_name" {
  description = "Azure resource group in which k8s cluster needs to be created"
}

variable "os_username" {
  description = "Name of OS administrative user"
}

variable "vnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist"
}

variable "enable_auto_scaling" {
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "agent_pool_vmsize" {
  description = "The size/type of the VM we will provide K8s for nodes."
}

variable "agent_pool_count" {
  description = "Number of Agents (VMs) in the Pool."
}

variable "min_count" {
  description = "Number of Agents to start the k8s cluster with"
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace which the OMS Agent should send data to"
}