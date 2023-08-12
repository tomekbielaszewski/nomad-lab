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
      n.vm.provision "shell", path: "node-install.sh"
      if i == 1
        # Expose the nomad ports
        n.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true
        n.vm.hostname = "nomad-server-node"
      end

      if i > 1
        n.vm.hostname = "nomad-node-#{i}"
      end

      n.vm.network "private_network", ip: "172.16.1.#{i+100}"
    end
  end
end
