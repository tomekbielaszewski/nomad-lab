# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

log_level = "DEBUG"

data_dir = "/opt/consul"

ui_config {
  enabled = true
}

server = true
bind_addr = "0.0.0.0"
advertise_addr = "172.16.1.101"
bootstrap_expect=1 # in homelab environment there will be only one server