#!/bin/bash

ANSIBLE_DIR="/vagrant/home/ansible/ansible" 
ANSIBLE_HOSTS="/provisioning/vagranthosts"
HOSTS_LOCATION_ON_VM="/vagrant/home/ansible/ansible_hosts"

cd ${ANSIBLE_DIR}
cp /vagrant/${ANSIBLE_HOSTS} ${HOSTS_LOCATION_ON_VM} && chmod -x ${HOSTS_LOCATION_ON_VM}

# Install Ansible on guest VM
echo "Installing Ansible on guest VM"
touch /home/vagrant/.bashrc
echo "source $ANSIBLE_DIR/hacking/env-setup" >> /home/vagrant/.bashrc
echo "export ANSIBLE_HOSTS=${TEMP_HOSTS}" >> /home/vagrant/.bashrc

echo "provision.sh completed running."

# It should now be possible to run Ansible from the VM by entering:
# ansible-playbook /vagrant/include/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local"
