#!/bin/bash

# ANSIBLE_DIR="/home/vagrant/ansible" 
# ANSIBLE_HOSTS="/vagranthost"
# HOSTS_LOCATION_ON_VM="/home/vagrant/ansible_hosts"

# cp /vagrant${ANSIBLE_HOSTS} ${HOSTS_LOCATION_ON_VM} && chmod -x ${HOSTS_LOCATION_ON_VM}

# Install the dependencies Ansible requires on guest VM
# echo "Installing Ansible dependencies and Git"
# echo "Update apt cache"
# apt-get update
# apt-get install -y git python-yaml python-paramiko python-jinja2

# Install Ansible on guest VM
# echo "Cloning Ansible"
# git clone git://github.com/ansible/ansible.git ${ANSIBLE_DIR} 

# echo "Installing Ansible on guest VM"
# mkdir -p ${ANSIBLE_DIR}
# touch /home/vagrant/.bashrc
# echo "source $ANSIBLE_DIR/hacking/env-setup" >> /home/vagrant/.bashrc
# echo "export ANSIBLE_HOSTS=${HOSTS_LOCATION_ON_VM}" >> /home/vagrant/.bashrc

# echo "provision.sh completed running."
#echo "You will now be able to use Ansible to install the rest of the packages / frameworks you require"

# It should now be possible to run Ansible from the VM by entering:
# ansible-playbook /vagrant/include/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local"

echo "--------------------"
echo "Running provision.sh"
echo "--------------------"


# First install pip
echo "Installing PIP"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# Now use pip to install other ansible dependencies
echo "Using PIP to install Ansible dependencies"
sudo pip install paramiko PyYAML jinja2 httplib2

# Now use pip to install Ansible
echo "Using PIP to install Ansible"
sudo pip install ansible