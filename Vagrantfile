# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-22.04" # 22.04 LTS, Jammy
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 4
  end

  # 5-node configuration
  (1..5).each do |i|
    config.vm.define "nomad-node-#{i}" do |n|

      # server
      if i == 1
        # Expose the nomad ports
        n.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true
        n.vm.hostname = "nomad-server-node"
        n.vm.provision "file", source: "./nomad/server.hcl", destination: "/tmp/nomad.hcl"
        n.vm.provision "file", source: "./consul/server.hcl", destination: "/tmp/consul.hcl"
      end

      # clients
      if i > 1
        n.vm.hostname = "nomad-node-#{i}"
        n.vm.provision "file", source: "./nomad/clients.hcl", destination: "/tmp/nomad.hcl"
        n.vm.provision "file", source: "./consul/client#{i}.hcl", destination: "/tmp/consul.hcl"
      end

      n.vm.network "private_network", ip: "172.16.1.#{i+100}"
      n.vm.provision "shell", path: "node-install.sh"
    end
  end
end
