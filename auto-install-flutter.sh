#!/bin/bash

git="git"
username=$(whoami)
#path_check =$(grep 'export PATH="$PATH:/home/${username}/flutter/bin"' /home/$username/.bashrc
if [  -d "/home/${username}/flutter" ] 
then
	echo "Flutter directory already exists in /home/${username}/flutter."
        export PATH="$PATH:`pwd`/flutter/bin"
        flutter precache	
        flutter doctor



else
	echo "No flutter dir found in /home/${username}/flutter  Installation will begin soon..."
	if [! dpkg -s $git >/dev/null 2>&1 ]
	then
		echo "git is not installed"
		apt install git -y
	else
		echo "git is installed"
	fi
	git clone https://github.com/flutter/flutter.git
	export PATH="$PATH:`pwd`/flutter/bin"
	flutter precache
	flutter doctor

fi


