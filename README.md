# dev-environment

Vagrant based general purpose development environment with Ansible playbooks to install common frameworks (e.g. JVM / SBT / Ruby RVM / Python VirtualEnv etc.


## How to use

1. Clone the repo
2. Build the VM i.e. `vagrant up`
3. SSH into the VM i.e. `vagrant ssh`

Now you can run the different playbooks e.g.

	ansible-playbook /vagrant/include/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local"
