echo "Installing Docker..."
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
sudo apt-get update
sudo apt-get install -y docker-ce
# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart
# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant
sudo docker --version


echo "Installing Nomad..."
sudo apt-get update && sudo apt-get install wget gpg coreutils
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install nomad

nomad -v

sudo cp /tmp/nomad.hcl /etc/nomad.d/nomad.hcl

sudo systemctl enable nomad.service
sudo systemctl start nomad.service
sudo systemctl status nomad.service

echo "Installing Consul..."
sudo apt-get update && sudo apt-get install consul

sudo cp /tmp/consul.hcl /etc/consul.d/consul.hcl

sudo systemctl enable consul.service
sudo systemctl start consul.service
sudo systemctl status consul.service

nomad -autocomplete-install
