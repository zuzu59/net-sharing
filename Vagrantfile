# Le Vagrantfile à zuzu
# zf151029.1753, zf170701.0105

#Script Vagrant qui permet de provisionner 1+3 machines Linux Ubuntu
#mach1, machine en mode graphique
#mach2, mach3 et mach4, machines en mode console

#Usage:
#pour créer ou allumer: vagrant up mach1, ou vagrant up mach1 mach2, ou vagrant up, démarre toutes les machines !
#pour se connecter en ssh: vagrant ssh...même chose que pour 'up'
#pour suspendre: vagrant suspend...même chose que pour 'up'
#pour réveiller: vagrant resume...même chose que pour 'up'
#pour détruire: vagrant destroy...même chose que pour 'up'
#pour connaitre l'état: vagrant status

#Login: vagrant
#Password: vagrant


# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  #config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "512"
  #end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL


#    config.vm.provision "shell", inline: "echo Hello"


$prov1 = <<SCRIPT

echo I am provisioning...

echo change keyboard...
sed -i.bak 's/^XKBMODEL=.*/XKBMODEL="macintosh"/' /etc/default/keyboard
sed -i.bak 's/^XKBLAYOUT=.*/XKBLAYOUT="ch"/' /etc/default/keyboard
sed -i.bak 's/^XKBVARIANT=.*/XKBVARIANT="fr"/' /etc/default/keyboard
sed -i.bak 's/^XKBOPTIONS=.*/XKBOPTIONS="lv3:alt_switch"/' /etc/default/keyboard
setupcon --force

echo update and upgrade
apt-get -y update
#apt-get -y upgrade

echo remove chef and puppet...
dpkg -P chef chef-zero puppet puppet-common

echo install xfce4
#apt-get -y update
apt-get -y install xfce4 xdm xfce4-terminal

echo patch miscfiles
sudo apt-get -y remove miscfiles
sudo apt-get -y autoremove

echo install conky
apt-get -y install conky
echo "conky -a top_right -d" > zconky.sh
chmod +x zconky.sh

echo install utils
apt-get -y install firefox git

echo setting MarkDown to PDF
echo "sudo apt-get install pandoc texlive-latex3" > zmd2pdf.sh
chmod +x zmd2pdf.sh

echo clean...
apt-get -y autoremove
apt-get -y clean
apt-get -y autoclean

echo finished...
echo reboot...
reboot
SCRIPT



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
#echo upgrade
#apt-get -y upgrade

#echo remove chef and puppet...
#dpkg -P chef chef-zero puppet puppet-common

#echo clean...
#apt-get -y autoremove
#apt-get -y clean
#apt-get -y autoclean

echo copy net-sharing files...
cp /vagrant/dhcpd.conf .
cp /vagrant/start.sh .

echo finished...
echo Use: vagrant ssh mach1, and after ./start.sh

SCRIPT




    config.vm.define "mach1" do |mach1|
   	 mach1.vm.box = "ubuntu.trusty.server"
    	mach1.vm.provider "virtualbox" do |vb|
   		 # Display the VirtualBox GUI when booting the machine
  			 vb.gui = true
   		 # Customize the amount of memory on the VM:
  			 vb.memory = "400"
   	 end
#   	 mach1.vm.network "private_network", ip: "192.168.33.1"
   	 mach1.vm.network "public_network" , bridge: "en3: Ethernet Thunderbolt" , ip: "192.168.2.1"
   	 # ,auto_config: false
   	 mach1.vm.hostname = "mach1"
   	 mach1.vm.provision "shell", inline: $prov2
   	 mach1.vm.provision :shell, path: "start.sh", run: 'always'
    end
    
    
    config.vm.define "mach2" do |mach2|
   	 mach2.vm.box = "ubuntu.trusty.server"
    	mach2.vm.provider "virtualbox" do |vb|
   		 # Display the VirtualBox GUI when booting the machine
  			 vb.gui = true
   		 # Customize the amount of memory on the VM:
  			 vb.memory = "200"
   	 end
   	 #mach2.vm.network "public_network"
   	 mach2.vm.network "private_network", ip: "192.168.33.2"
   	 mach2.vm.hostname = "mach2"
   	 mach2.vm.provision "shell", inline: $prov2
    end


    config.vm.define "mach3" do |mach3|
   	 mach3.vm.box = "ubuntu.trusty.server"
    	mach3.vm.provider "virtualbox" do |vb|
   		 # Display the VirtualBox GUI when booting the machine
  			 vb.gui = true
   		 # Customize the amount of memory on the VM:
  			 vb.memory = "200"
   	 end
   	 #mach3.vm.network "public_network"
   	 mach3.vm.network "private_network", ip: "192.168.33.3"
   	 mach3.vm.hostname = "mach3"
   	 mach3.vm.provision "shell", inline: $prov2
    end


    config.vm.define "mach4" do |mach4|
   	 mach4.vm.box = "ubuntu.trusty.server"
    	mach4.vm.provider "virtualbox" do |vb|
   		 # Display the VirtualBox GUI when booting the machine
  			 vb.gui = true
   		 # Customize the amount of memory on the VM:
  			 vb.memory = "200"
   	 end
   	 #mach4.vm.network "public_network"
   	 mach4.vm.network "private_network", ip: "192.168.33.4"
   	 mach4.vm.hostname = "mach4"
   	 mach4.vm.provision "shell", inline: $prov2
    end


end
