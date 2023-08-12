# Full configuration options can be found at https://www.consul.io/docs/agent/options.html

log_level = "DEBUG"
log_file = "/var/log/"

data_dir = "/opt/consul"

# client_addr
# The address to which Consul will bind client interfaces, including the HTTP and DNS
# servers. By default, this is "127.0.0.1", allowing only loopback connections. In
# Consul 1.0 and later this can be set to a space-separated list of addresses to bind
# to, or a go-sockaddr template that can potentially resolve to multiple addresses.
#client_addr = "0.0.0.0"

bind_addr = "172.16.1.103"

retry_join = ["172.16.1.101"]