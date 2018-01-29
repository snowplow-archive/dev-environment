# Snowplow Development Environment

[Vagrant] [vagrant]-based development environment with [Ansible] [ansible] playbooks to install common tools, including:

* The JVM ecosystem
* Ruby
* Postgres

Works fine on Linux, Mac and Windows hosts.

Used as the development environment for all [Snowplow Analytics] [snowplow] projects.

## Installation

### Dependencies

To use this development environment, you need to have [Vagrant] [vagrant-install] and [VirtualBox] [virtualbox-install] installed.

We also recommend installing vagrant-vbguest to prevent the VirtualBox Guest Additions from getting out of sync:

	$ vagrant plugin install vagrant-vbguest

### Starting Vagrant

First, clone the repo, including `ansible-playbooks` submodule:

	$ git clone --recursive https://github.com/snowplow/dev-environment.git
	$ cd dev-environment

By default the development environment is configured with 2 GB of RAM. You can adjust this by running the `configure.sh` script, e.g. for 5 GB try:

	$ ./scripts/configure.sh 5

Now you can build the VM:

	$ vagrant up

And SSH into it:

	$ vagrant ssh

### Installing software

The guest VM has Ansible installed. This means you can run the different [Ansible playbooks] [ansible-playbooks] directly, thus:

```
$ ansible-playbook /vagrant/vagrant/oss-playbooks/{{PLAYBOOK_NAME}}.yml \
--inventory-file=/vagrant/vagrant/ansible.hosts --connection=local
```

For example, to install the development environment for working on the Snowplow batch-based enrichment process:

```
$ ansible-playbook /vagrant/vagrant/oss-playbooks/snowplow-batch-pipeline.yml \
--inventory-file=/vagrant/vagrant/ansible.hosts --connection=local

```

To simply install Java-7:

```
$ ansible-playbook /vagrant/vagrant/oss-playbooks/java-7.yml \
--inventory-file=/vagrant/vagrant/ansible.hosts --connection=local
```

A whole host of playbooks can be found in the [ansible-playbooks] (https://github.com/snowplow/ansible-playbooks). Playbooks in the root of the project can be run directly - these are composed of [roles] (https://github.com/snowplow/ansible-playbooks/tree/master/roles) that individually install specific components of development environments. For more information on composing your own development environments out of the individual roles, see the [ansible-playbooks README] (https://github.com/snowplow/ansible-playbooks).

### Starting developing

We recommend removing git tracking from the dev environment before starting coding. You can do these either from the host or the guest VM:

    $ rm -rf .git*

Now you can safely pull down the codebase you want to work on e.g:

    $ git clone https://github.com/snowplow/snowplow.git

## Available playbooks

Please see our [Ansible playbooks] [ansible-playbooks] repository for the full list.

## Copyright and license

Snowplow Development Environment is copyright 2014 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0] [license] (the "License");
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
[ansible]: http://www.ansibleworks.com/

[snowplow]: http://snowplowanalytics.com

[ansible-playbooks]: https://github.com/snowplow/ansible-playbooks

[license]: http://www.apache.org/licenses/LICENSE-2.0
