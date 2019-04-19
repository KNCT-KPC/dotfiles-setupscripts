#!/bin/bash

#Questions
echo "Will ask you a couple of questions first"
echo "Please answer yes or no"
echo "These questions are set to no by default"

echo "Will modify the files that think are necessary and install the software"
read -p "Do you allow it? [yes/no]: " do

if [ $do = "yes" ] || [ $do = "y" ] || [ $do = "YES" ] || [ $do = "Y" ] || [ $do = "Yes" ]; then

		read -p "Do you want to install joke softwares? [yes/no]: " joke
		read -p "student number :" num
		read -sp "pass :" pass
		export https_proxy="http://${num}:${pass}@157.114.16.93:8080"
		export http_proxy="http://${num}:${pass}@157.114.16.93:8080"

		#Apt
		yes | sudo -E apt-get update
		yes | sudo -E apt-get upgrade
		yes | sudo -E apt-get dist-upgrade
		yes | sudo -E apt-get update

#Lang
		yes | sudo -E apt-get install gcc gauche
		yes | sudo -E apt-get install nodejs
		yes | sudo -E apt-get install npm

#Editor
		yes | sudo -E apt-get install vim emacs

#SetupEditor
		wget https://raw.githubusercontent.com/KNCT-KPC/dotfiles/master/.vimrc
		wget https://raw.githubusercontent.com/no1fushi/ConfigFile/master/soft/emacs/init.el
		mkdir .emacs.d
		mv init.el ~/.emacs.d/

#Tool
		yes | sudo -E apt-get install tree curl traceroute
		yes | sudo -E apt-get install git
		yes | sudo -E apt-get install fortune
		yes | sudo -E apt-get install tmux

		git config --global http.proxy http://${num}:${pass}@157.114.16.93:8080
		git config --global https.proxy http://${num}:${pass}@157.114.16.93:80$
		git config --global url."https://".insteadof git://
#Joke
if [ $joke = "yes" ] || [ $joke = "y" ] || [ $joke = "YES" ] || [ $joke = "Y" ] || [ $joke = "Yes" ]; then
		yes | sudo -E apt-get install sl cowsay
		yes | sudo -E apt-get install screenfetch
		echo 'screenfetch' >> ~/.bash_profile
fi

#Setup .bash_profile
		wget https://raw.githubusercontent.com/KNCT-KPC/dotfiles/master/start.sh
		chmod u+x start.sh
		echo 'source ~/.bashrc' >> ~/.bash_profile
		echo 'echo -e "\n Disk capacity"' >> ~/.bash_profile
		echo 'df -h' >> ~/.bash_profile
		echo 'echo -e "\n"' >> ~/.bash_profile
		echo 'echo -e "\n Users logged in at the same time"' >> ~/.bash_profile
		echo 'w' >> ~/.bash_profile
		echo 'source $HOME/start.sh' >> ~/.bashrc

		sudo cp .bash_profile /root/
		sudo cp .bashrc /root/
		sudo cp -r .emacs.d/ /root/
		sudo cp .vimrc /root/

#Apt-clean
		yes | sudo -E apt-get update
		yes | sudo -E apt-get autoremove --purge
		yes | sudo -E apt-get clean
		source .bash_profile
#del git config global
		git config --global --unset http.proxy
		git config --global --unset https.proxy
		git config --global --unset url."https://".insteadOf git://
else
		exit
fi
