# net-share
Permet de partager (WIFI2FIXE) facilement sa connexion Internet WIFI sur l'interface fixe de sa machine

# Buts
Pour qu'une installation de DietPi sur un RasPi ou clone puisse se terminer, il est exigé une connexion Internet. A la maison pas de problème, il suffit de brancher son RasPi sur une prise réseau de son routeur mais quand on n'a pas de connexion fixe c'est un problème.

Le but est donc de partager sa connexion Internet WIFI sur sa prise réseau fixe de son portable afin de pouvoir y brancher le RasPi.

On pourrait utiliser très facilement le 'partage réseau' de sa machine pour cela, mais quand on on se trouve connecté sur un réseau WIFI d'entreprise, on aura un message d'interdiction de partage de la connexion pour des raisons de sécurité !

# Moyens
On va donc utiliser une petite config réseau à la mano pour le faire sans problème d'interdiction ;-)

Afin de ne pas polluer sa machine, car on va installer un petit serveur DHCP pour le confort, on va le faire dans une Vagrant Box avec une petite machine virtuelle Linux Ubuntu.

C'est un peu un canon pour tuer les mouches, mais cela à l'avantage de passer partout sans laisser de traces dans la config réseau de sa machine.

# Installation et utilisation
Il faut en premier installer VirtualBox, Vagrant et GIT sur sa machine, puis de faire un

``git clone https://github.com/zuzu59/net-sharing.git``

Après aller dans le dossier 'net-sharing' pour vérifier si l'interface réseau fixe de sa machine est correct (la configuration est faite pour un Macbook).

ATTENTION, il faut que l'adaptateur réseau soit branché sur le portable !

Puis:

``vagrant status``

Pour voir si tout est en ordre, on devrait voir qu'il y a une machine mach1 'not created'. Et enfin:

``vagrant up``

La machine virtuelle Linux Ubuntu devrait se créer et démarrer. Le partage réseau devrait fonctionner sans autre.

Pour arrêter la machine virtuelle:

``vagrant halt``

Pour détruire la machine virtuelle:

``vagrant destroy``

Pour endormir ou réveiller la machine virtuelle:

``vagrant suspend ou vagrant up``

Pour se connecter sur la machine virtuelle (dépannage):

``vagrant ssh``

Plus d'info sur:

https://drive.google.com/open?id=18Ic35yOlgNIgdS_aGpk5hhW-4teGr2YIpg9byWMGiow

# Source d'inspiration
https://wiki.archlinux.org/index.php/Internet_sharing

 .
