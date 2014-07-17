#!/bin/bash

ANSIBLE_DIR="/home/vagrant/ansible" 
ANSIBLE_HOSTS="/vagranthost"
HOSTS_LOCATION_ON_VM="/home/vagrant/ansible_hosts"

cp /vagrant${ANSIBLE_HOSTS} ${HOSTS_LOCATION_ON_VM} && chmod -x ${HOSTS_LOCATION_ON_VM}

# Install the dependencies Ansible requires on guest VM
echo "Installing Ansible dependencies and Git"
echo "Update apt cache"
apt-get update
apt-get install -y git python-yaml python-paramiko python-jinja2

# Install Ansible on guest VM
echo "Cloning Ansible"
mkdir -p ${ANSIBLE_DIR}
git clone git://github.com/ansible/ansible.git ${ANSIBLE_DIR} 
# First checkout v1.6.6
cd ${ANSIBLE_DIR}
git checkout tags/v1.6.6

echo "Installing Ansible on guest VM"
touch /home/vagrant/.bashrc
echo "source $ANSIBLE_DIR/hacking/env-setup" >> /home/vagrant/.bashrc
echo "export ANSIBLE_HOSTS=${HOSTS_LOCATION_ON_VM}" >> /home/vagrant/.bashrc

echo "provision.sh completed running."
echo "You will now be able to use Ansible to install the rest of the packages / frameworks you require"

# It should now be possible to run Ansible from the VM by entering:
# ansible-playbook /vagrant/include/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local"
