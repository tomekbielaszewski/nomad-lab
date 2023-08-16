# Nomad Lab

:mask: This is my learning repository. A sandbox. It is not stable, it is not meant to be stable. It's a lab. :mask:

:anger: DO NOT USE THIS IN PRODUCTION! :anger:

Here I'm learning how to automatically set up a Nomad cluster with service discovery by Consul. The clusters will be 
working on couple of VMs created with Vagrantfile.

## My expectations

I'm planning to run a couple of workloads on this to learn how scheduling and orchestration works, how consuls service 
discovery works. To play a bit with scaling etc.

I will call this lab experiment complete when I will be able to:
- schedule jobs (as in official tutorial with employees, tasks and stuff)
- see this working in Nomad UI
- see this working in Consul UI
- see the app working in my browser on the host

### Known issues
- [x] `nomad node status` doesn't show all nodes
- [x] `consul members` doesn't show all nodes
- [ ] Nomad is unable to schedule nginx job like in https://blog.pavelsklenar.com/two-node-nomad-cluster/
- [ ] Consul UI is not loading on host machine in the browser
- [x] Nomad UI is not loading on host machine in the browser

## Requirements for the host machine

Vagrant installed  
Virtualbox installed

## Useful host commands

`vagrant up`  
`vagrant list-commands`  
`vagrant status`  
`vagrant halt`  
`vagrant destroy -f`  

`vagrant ssh nomad-node-1`  

## Useful node commands

`nomad node status`  
`consul members`

`nomad config validate /tmp/nomad.hcl`  
`consul validate /tmp/consul.hcl`  

### Consul and Nomad works as systemd services

Consul: `consul.service`  
Nomad: `nomad.service`  

Service lifecycle:  
`sudo systemctl enable consul.service`  
`sudo systemctl start consul.service`  
`sudo systemctl status consul.service --lines 10`  
`sudo systemctl stop consul.service`  
`sudo systemctl disable consul.service`

When changed the config or service file:  
`sudo systemctl daemon-reload`  

Inspecting logs:  
`sudo journalctl -xeu consul.service`  
`cat /etc/systemd/system/consul.service`

Editing config:  
`sudo nano /etc/consul.d/consul.hcl`  

## Notes

Official docs doesn't show how to set up cluster on local node. Just terraform-based setup on cloud. Or I'm blind or not eager enough to find.

Here is an example of how to set up two nodes cluster. I will try later to extend it for an N-node cluster: https://blog.pavelsklenar.com/two-node-nomad-cluster/

## Sources

https://developer.hashicorp.com/nomad/tutorials/cluster-setup  
https://github.com/hashicorp/nomad/blob/main/demo/vagrant/README.md  
https://github.com/discoposse/nomad-vagrant-lab  