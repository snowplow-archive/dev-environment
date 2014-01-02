# dev-environment

Vagrant based general purpose development environment with Ansible playbooks to install common frameworks (e.g. JVM / SBT / Ruby RVM / Python VirtualEnv etc.


## Installation

First, clone the repo

	$ git clone git@github.com:snowplow/dev-environment.git
	$ cd dev-environment

We recommend installing [vagrant-vbguest](git@github.com:snowplow/dev-environment.git) (to ensure that the VM guest addition match those installed on Virtual Box on the host):

	$ vagrant plugin install vagrant-vbguest

Now you can build the VM

	$ vagrant up

And SSH into it...

	$ vagrant SSH

The guest VM has ansible installed. This means you can run the different playbooks directly e.g.

	ansible-playbook /vagrant/ansible-playbooks/playbook-name.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local

For example, to run the 'basic-necessities' playbook:

	ansible-playbook /vagrant/ansible-playbooks/basic-necessities.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local

To install the Ruby environment:

	ansible-playbook /vagrant/ansible-playbooks/ruby.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local

See the '/ansible-playbooks' folder for a complete list of playbooks to run.