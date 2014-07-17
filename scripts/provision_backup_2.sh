#!/bin/bash

echo "--------------------"
echo "Running provision.sh"
echo "--------------------"

sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo apt-get update -y
sudo apt-get install ansible -y


ANSIBLE_DIR="/home/vagrant/ansible" 
ANSIBLE_HOSTS="/vagranthost"
HOSTS_LOCATION_ON_VM="/home/vagrant/ansible_hosts"

cp /vagrant${ANSIBLE_HOSTS} ${HOSTS_LOCATION_ON_VM} && chmod -x ${HOSTS_LOCATION_ON_VM}