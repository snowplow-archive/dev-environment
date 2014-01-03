Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Make it possible to use the SSH keys from the host
  config.ssh.forward_agent = true

  # Forward guest port 4000 to host port 4001 (for Jekyll)
   config.vm.network "forwarded_port", guest: 4000, host: 4001

  # Change some default options for better experience, up memory and change VM name
  config.vm.provider :virtualbox do |vb|
    # Sets VM name equal to the parent directory + millis when started
    vb.name = Dir.pwd().split("/")[-1] + "-" + Time.now.to_f.to_i.to_s
    vb.customize ["modifyvm", :id, "--memory", "2058"]
  end

  # Run the provision.sh file, which install Ansible on the guest VM
  config.vm.provision :shell do |sh|
    sh.path = "provision.sh"
  end
end