resource "hcloud_ssh_key" "k8s_key" {
  name       = "k8s-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "k8s_node" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.k8s_key.id]

  labels = {
    role = "k8s-node"
  }
}
