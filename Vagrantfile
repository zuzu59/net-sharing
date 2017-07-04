# Le Vagrantfile simplifié à zuzu pour le net-sharing WIFI2FIXE
# zf151029.1753, zf170704.0912

#Script Vagrant qui permet de provisionner 1 machines Linux Ubuntu pour faire du net-sharing WIFI2FIXE

#Usage:
#pour créer ou allumer: vagrant up
#pour se connecter en ssh: vagrant ssh
#pour suspendre: vagrant suspend
#pour réveiller: vagrant resume
#pour détruire: vagrant destroy
#pour connaitre l'état: vagrant status

#Login: vagrant
#Password: vagrant

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

$prov2 = <<SCRIPT
	echo I am provisioning...

	echo change keyboard...
	sed -i.bak 's/^XKBMODEL=.*/XKBMODEL="macintosh"/' /etc/default/keyboard
	sed -i.bak 's/^XKBLAYOUT=.*/XKBLAYOUT="ch"/' /etc/default/keyboard
	sed -i.bak 's/^XKBVARIANT=.*/XKBVARIANT="fr"/' /etc/default/keyboard
	sed -i.bak 's/^XKBOPTIONS=.*/XKBOPTIONS="lv3:alt_switch"/' /etc/default/keyboard
	setupcon --force

	echo update...
	apt-get -y update

	echo copy net-sharing files...
	cp /vagrant/dhcpd.conf .
	cp /vagrant/start.sh .
	cp /vagrant/dhcp-list.sh .

	echo finished...
SCRIPT

config.vm.define "mach1" do |mach1|
	mach1.vm.box = "ubuntu/trusty32"
	mach1.vm.provider "virtualbox" do |vb|
	 # Display the VirtualBox GUI when booting the machine
		 vb.gui = true
	 # Customize the amount of memory on the VM:
		 vb.memory = "400"
	end
	mach1.vm.network "public_network" , bridge: "toto" , ip: "192.168.2.1"
	mach1.vm.hostname = "mach1"
	mach1.vm.provision "shell", inline: $prov2
	mach1.vm.provision :shell, path: "start.sh", run: 'always'
end
    
end
