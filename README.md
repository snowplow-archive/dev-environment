# dev-environment

Vagrant based general purpose development environment with Ansible playbooks to install common frameworks (e.g. JVM / SBT / Ruby RVM / Python VirtualEnv etc.


## How to use

1. Clone the repo
2. Build the VM i.e. `vagrant up`
3. SSH into the VM i.e. `vagrant ssh`

Now you can run the different playbooks e.g.

	ansible-playbook /vagrant/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local

For example, to run the 'basic-necessities' playbook:

	ansible-playbook /vagrant/ansible-playbooks/basic-necessities.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local

To install the Ruby environment:

	ansible-playbook /vagrant/ansible-playbooks/ruby.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local