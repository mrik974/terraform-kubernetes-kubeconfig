
locals {
  content = templatefile("${path.module}/kubeconfig-template.tpl", { contexts = var.contexts, clusters = var.clusters, users = var.users, current_context = var.current_context })
}

output "kubeconfig_content" {
  value       = yamldecode(local.content)
  description = "HCL representation of kubeconfig file contents"
  sensitive   = true
}

output "kubeconfig_content_yaml" {
  value       = local.content
  description = "Yaml representation of kubeconfig file contents"
  sensitive   = true
}