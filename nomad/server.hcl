log_level = "DEBUG"

data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

# Give the agent a unique name. Defaults to hostname
name = "nomad-server-node"

advertise {
  # Defaults to the first private IP address.
  http = "172.16.1.101"
  rpc  = "172.16.1.101"
  serf = "172.16.1.101"
}

server {
  enabled = true

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}