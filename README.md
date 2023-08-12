# Nomad Lab

I will learn Nomad in this repo. I'm planning to use Vagrant to set up a bunch of VMs, install Nomad there and run some 
workflows.

## Useful commands

`vagrant up`  
`vagrant list-commands`  
`vagrant status`  
`vagrant halt`  
`vagrant destroy -f`  
`vagrant ssh nomad-node-1`  

`sudo nomad agent -dev -bind 0.0.0.0 -network-interface='{{ GetDefaultInterfaces | attr "name" }}'`  
`export NOMAD_ADDR=http://localhost:4646`  
`nomad node status`

## Notes

Official docs doesn't show how to set up cluster on local node. Just terraform-based setup on cloud.

Here is an example of how to set up two nodes cluster. I will try later to extend it for an N-node cluster: https://blog.pavelsklenar.com/two-node-nomad-cluster/

## Sources

https://developer.hashicorp.com/nomad/tutorials/cluster-setup  
https://github.com/hashicorp/nomad/blob/main/demo/vagrant/README.md  
https://github.com/discoposse/nomad-vagrant-lab  