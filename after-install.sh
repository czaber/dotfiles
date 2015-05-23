sudo apt-get update
sudo apt-get upgrade

sudo apt-get install chromium-browser
sudo apt-get install mesa-utils
sudo apt-get install vim git
sudo apt-get install rdesktop vncviewer
sudo apt-get install rxvt-unicode
sudo apt-get install htop
sudo apt-get install dconf-tools
sudo apt-get install zathura
sudo apt-get install screen
sudo apt-get install openconnect vpnc-scripts 
sudo apt-get install network-manager-openvpn 
sudo apt-get install network-manager-openconnect

sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get install elementary-tweaks

sudo dpkg --add-architecture i386
sudo apt-get install gdebi
wget download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb

sudo mkdir /etc/X11/xorg.conf.d/
echo -e 'Section "Device"\n Identifier "Intel Graphics"\n Driver "Intel"\n Option "AccelMethod" "sna"\n Option "TearFree" "true"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
git clone https://github.com/czaber/dotfiles .dotfiles

ln -s ~/.dotfiles/icons ~
ln -s ~/.dotfiles/.fonts ~
ln -s ~/.dotfiles/.bashrc ~
ln -s ~/.dotfiles/.vimrc ~
ln -s ~/.dotfiles/.screenrc ~
ln -s ~/.dotfiles/.config/dconf/ ~/.config/dconf
ln -s ~/.dotfiles/.config/zathura/ ~/.config/zathura

fc-cache 
