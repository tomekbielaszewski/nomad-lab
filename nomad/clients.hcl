# Increase log verbosity
log_level = "DEBUG"

data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

# Give the agent a unique name. Defaults to hostname
# name = "client1" # it should stay as the hostname for vagrant-managed nodes

# Enable the client
client {
  enabled = true

  # For demo assume we are talking to a static server. For production,
  # this should be like "nomad.service.consul:4647" and a system
  # like Consul used for service discovery.
  servers = ["172.16.1.101"]
}

# Enable raw_exec Nomad driver
plugin "raw_exec" {
  config {
    enabled = true
  }
}

# Consul agent will be running locally
consul {
  address = "127.0.0.1:8500"
}