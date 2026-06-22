resource "hcloud_ssh_key" "k8s_key" {
  name       = "k8s-ssh-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "hcloud_server" "k8s_node" {
  name        = "k8s-node"
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.k8s_key.id]

  labels = {
    role = "k8s-node"
  }
}
