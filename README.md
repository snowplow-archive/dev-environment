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

See the `/ansible-playbooks` folder for a complete list of playbooks to run.

## An overview of the different playbooks

| ** Playbook name ** | ** Description ** | ** Dependencies ** |
|:--------------------|:------------------|:-------------------|
| [basic-necessities.yaml][basic-necessities-playbook] | Installs basic utilities that are useful on the dev box e.g. Git, Vim etc. | None |
| [ruby-playbook.yaml][ruby-playbook] | Installs RVM, Ruby version to 1.9.3 and sets default Ruby to 1.9.3 | None |
| [snowplow-website.yaml][snowplow-website-playbook] | Installs the environment for updating the Snowplow website. (This is available on the [snowplow.github.com] [snowplow-website] repo.) | Depends on the Ruby playbook having been run on the dev box |
| [jvm6.yaml][jvm-playbook] | Installs Java 6, SBT and Scala. Note that Java 6 rather than Java 7 is installed as this is the version used by Amazon on EMR. | None |
| [postgres-8.4][postgres-playbook] | Installs Postgres 8.4. (Note that we use this version rather than version 9 to ensure compatibility with Amazon Redshift) | None |


[basic-necessities-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/basic-necessities.yaml
[ruby-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/ruby.yaml
[snowplow-website-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/snowplow-website.yaml
[snowplow-website]: /snowplow/snowplow.github.com
[jvm-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/jvm6.yaml
[postgres-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/postgres-8.4.yaml