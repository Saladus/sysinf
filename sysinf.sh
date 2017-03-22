#!/bin/bash

kasutaja=`whoami`
raal=`uname -n`
os=`head -1 /etc/os-release | grep -o -P '(?<=").*(?=")'`
kernel=`uname -m && uname -r`
viimane_boot=`uptime -s`

if [[ $os == Arch\ Linux ]]
	then pakette=`pacman  -Q | wc -l`
elif [[ $os == Ubuntu ]] 
	then pakette=`dpkg --get-selections | grep -v uninstall | wc -l`
fi

ul=`tput smul`
rmul=`tput rmul`
b=`tput bold`
sinine=`tput setaf 6`
ilma=`tput sgr0`

echo ${vi}${ul}${b}${sinine}$kasutaja${ilma}${ul}"@"${b}${sinine}$raal${ilma}
echo ${b}${sinine}"OS:"${ilma} $os
echo ${b}${sinine}"Kernel:"${ilma} $kernel
echo ${b}${sinine}"Shell:"${ilma} $SHELL
echo ${b}${sinine}"Tarkvara:"${ilma} $pakette
echo ${b}${sinine}"Ärkvel alates:"${ilma} $viimane_boot

if [[ $1 == -s ]]
	then scrot -cd 3
fi
