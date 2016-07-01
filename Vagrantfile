# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
dpkg -l python-pygit2 > /dev/null 2>&1 || sudo apt-get -y install python-pygit2
dpkg -l git > /dev/null 2>&1 || sudo apt-get -y install git
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "xenial"
  config.vm.provider :lxc do |lxc|
    lxc.customize 'kmsg', 0
    lxc.customize 'autodev', 1
    lxc.customize 'mount.entry', '/dev/dri dev/dri none bind,optional,create=dir'
    lxc.customize 'mount.entry', '/dev/snd dev/snd none bind,optional,create=dir'
    lxc.customize 'mount.entry', '/tmp/.X11-unix tmp/.X11-unix none bind,optional,create=dir'
    lxc.customize 'mount.entry', '/dev/video0 dev/video0 none bind,optional,create=file'
  end
  config.ssh.forward_x11 = true
  config.ssh.forward_env = ["DISPLAY"]

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "provision/salt", "/srv/salt"
  config.vm.synced_folder "provision/pillar", "/srv/pillar"

  config.vm.provision "shell", inline: $script

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "provision/minion"
    salt.run_highstate = false
    salt.colorize = true
    salt.verbose = true
    salt.log_level = "warning" 
  end
end
