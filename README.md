# dev-environment

[Vagrant] [vagrant]-based development environment with [Ansible] [ansible] playbooks to install common tools, including:

* The JVM ecosystem
* Ruby
* Postgres

Used as the development environment for all [Snowplow Analytics] [snowplow] projects.

## Installation

### Dependencies

To use this development environment, you need to have [Vagrant] [vagrant-install] and [VirtualBox] [virtualbox-install] installed.

The environment should work fine on Linux / Mac / Windows hosts.

We also recommend installing vagrant-vbguest to prevent the VirtualBox Guest Additions from getting out of sync:

	$ vagrant plugin install vagrant-vbguest

### Running from Vagrant

First, clone the repo:

	$ git clone git@github.com:snowplow/dev-environment.git
	$ cd dev-environment

Now you can build the VM:

	$ vagrant up

And SSH into it:

	$ vagrant ssh

### Installing software

The guest VM has Ansible installed. This means you can run the different [Ansible playbooks] [ansible-playbooks] directly, thus:

	ansible-playbook /vagrant/ansible-playbooks/{{PLAYBOOK_NAME}}.yaml --inventory-file=/vagrant/home/ansible/ansible_hosts --connection=local

For example, to run the 'base' playbook:

	ansible-playbook /vagrant/ansible-playbooks/base.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local

To install the Ruby and RVM environment:

	ansible-playbook /vagrant/ansible-playbooks/ruby-rvm.yaml --inventory-file=/home/vagrant/ansible_hosts --connection=local

## Available playbooks

The `/ansible-playbooks` folder contains the available playbooks:

| Playbook name | Description | Dependencies |
|:--------------------|:------------------|:-------------------|
| [base.yaml][base-playbook] | Installs basic utilities that are useful on the dev box e.g. Git, Vim etc. | None |
| [ruby-playbook.yaml][ruby-playbook] | Installs RVM, Ruby version to 1.9.3 and sets default Ruby to 1.9.3 | None |
| [snowplow-website.yaml][snowplow-website-playbook] | Installs the environment for updating the Snowplow website. (This is available on the [snowplow.github.com] [snowplow-website] repo.) | Depends on the Ruby playbook having been run on the dev box |
| [jvm6.yaml][jvm-playbook] | Installs Java 6, SBT and Scala. Note that Java 6 rather than Java 7 is installed as this is the version used by Amazon on EMR. | None |
| [postgres-8.4.yaml][postgres-playbook] | Installs Postgres 8.4. (Note that we use this version rather than version 9 to ensure compatibility with Amazon Redshift) | None |
| [play-framework.yaml][play-playbook] | Installs the Play 2 framework | This requires Java, so should be run *after* the [jvm6.yaml][jvm-playbook] |

## Copyright and license

Snowplow Dev Environment is copyright 2014 Snowplow Analytics Ltd.

Licensed under the **[Apache License, Version 2.0] [license]** (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[vagrant]: http://vagrantup.com
[vagrant-install]: http://docs.vagrantup.com/v2/installation/index.html
[virtualbox]: https://www.virtualbox.org
[virtualbox-install]: https://www.virtualbox.org/wiki/Downloads

[snowplow]: http://snowplowanalytics.com

[basic-necessities-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/basic-necessities.yaml
[ruby-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/ruby.yaml
[snowplow-website-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/snowplow-website.yaml
[snowplow-website]: /snowplow/snowplow.github.com
[jvm-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/jvm6.yaml
[postgres-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/postgres-8.4.yaml
[play-playbook]: /snowplow/dev-environment/blob/master/ansible-playbooks/play-framework.yaml

[license]: http://www.apache.org/licenses/LICENSE-2.0
