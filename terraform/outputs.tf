output "server_ip" {
  description = "Public IP of the k8s node"
  value       = hcloud_server.k8s_node.ipv4_address
}

output "server_name" {
  description = "Name of the server"
  value       = hcloud_server.k8s_node.name
}
