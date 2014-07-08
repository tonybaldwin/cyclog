#!/bin/bash

##############################################################
# installation script for cyclog                             #
# runners workout log management in bash by tony baldwin     #
# http://tonyb.us/cyclog                                     #
# released according to the terms of the GNU GPL v.3 or later#
##############################################################

if [ != "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi

rlpath="$HOME/.cyclog/"
editor="/usr/bin/vim"

echo "installing cyclog ... "
cp cyclog.sh $HOME/bin/cyclog
chmod +x $HOME/bin/cyclog

echo "Creating config files ... "
echo "# cyclog config " > $HOME/.cyclog.conf
read -p "Enter your name: " uname
read -p "Preferred distance unit (miles, km): " dunit
read -p "Where do you wish to keep your cyclog files? (default ~/.cyclog/ If you choose another directory, do not forget trailing slash.): " rlpath
read -p "What is your prefered editor? (default /usr/bin/vim): " editor
read -p "What is your prefered web browser? (i.e. /usr/bin/iceweasel) " browser
echo "uname=$uname" >> $HOME/.cyclog.conf
echo "rlpath=$rlpath" >> $HOME/.cyclog.conf
echo "editor=$editor" >> $HOME/.cyclog.conf
echo "browser=$browser" >> $HOME/.cyclog.conf

read -p "Will you use the redmatrix plugin? (y/n)" fplug
if [[ $rplug = y ]]; then
	read -p "Enter your redmatrix username (optional): " fuser
	read -p "Enter your redmatrix password (optional): " fpass
	read -p "Enter the url to your redmatrix site (optional): " $fsite
	echo "fplug=y" >> $HOME/.cyclog.conf
	echo "fuser=$fuser" >> $HOME/.cyclog.conf
	echo "fpass=$fpass" >> $HOME/.cyclog.conf
	echo "fsite=$fsite" >> $HOME/.cyclog.conf
else
	echo "rplug=n0pe" >> $HOME/.cyclog.conf
fi

echo "Installation complete."

cyclog h
exit