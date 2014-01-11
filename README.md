# dev-environment

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

### Generics

The `/ansible-playbooks/generic` folder contains the available playbooks:

| Category   | Name                                | Description                                                                      | Dependencies |
|:-----------|:------------------------------------|:---------------------------------------------------------------------------------|:-------------|
| `base`     | [`base.yaml`] [base-pb]             | Installs basic utilities that are useful on the dev box e.g. Git, Vim etc.       | None         |
| `jvm`      | [`jvm-6.yaml`] [jvm-6-pb]           |
* Oracle Java 1.6 (not v1.7, for Amazon EMR compatibility)
* Scala 2.10.3
* SBT 0.13.0
* Thrift 0.9.1 (Java 6 not Java 7 for Amazon EMR compatibility) | None         |
| `jvm`      | [`play-2.yaml`] [play-pb]           | Installs the Play 2 Framework                                                    | `jvm-6.yaml` |
| `db`       | [`postgres-8.4.yaml`] [postgres-pb] | Installs Postgres 8.4. (8.4 not 9 for Amazon Redshift compatibility)             | None         |
| `ruby`     | [`ruby-rvm.yaml`][ruby-playbook]    | Installs RVM, Ruby version to 1.9.3 and sets default Ruby to 1.9.3               | None         |

TODO: formally add jvm-6.yaml dependency into Play framework.

### Vendors

The `/ansible-playbooks/vendor` folder contains the available playbooks:

| Vendor                  | Name                                 | Description                                                  | Dependencies |
|:------------------------|:-------------------------------------|:-------------------------------------------------------------|:-------------|
| `com.snowplowanalytics` | [snowplow.github.com.yaml] [base-pb] | Ruby, Jekyll & Pygments for the Snowplow website's front-end | `ruby`       |

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
