#!/bin/bash
# This is a script designed to switch between several preconfigured layouts as defined by the xboxdrv settings held within modules.
# 2 parameters can be used : 1 → x for xbox controller, p for ps3
#                            2 → name of the game as suggested in menu

#configuration
export workingDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
#(thanks http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in)
cd $workingDirectory
. ./config.sh
if [ -e "$killProcessesScript" ]
then
	echo "There seems to be (a) running instance(s) of the game controller, do you want to brutally kill the processes? (Y/n)\nI'm not sure what it does if you don't…"
	read userinput
	if [ "$userinput" = "Y" ]
	then
		sh $killProcessesScript
		rm $killProcessesScript
		sleep 1
	fi
fi

if [ $# = 0 ]
then
	echo "(X)box or (P)S3 ?"
	read userinput
else
	userinput="$1"
fi

if [ "$userinput" = "p" -o "$userinput" = "P" -o "$userinput" = "PS3" -o "$userinput" = "ps3" ]
then
	pad=' --detach-kernel-driver'
	echo "PS3 it is → $pad"
elif [ "$userinput" = "X" -o "$userinput" = "x" -o "$userinput" = "Xbox" -o "$userinput" = "xbox" ]
then
	pad=""
	echo "Xbox it is"
else
	pad=""
	echo "Whatever"
fi
export pad

if [ $# -gt 1 ]
then
	userinput=$2
else
	# Give a list of available games
	echo What game would you like to play?
	echo 1\) vvvvvv
	echo 2\) Braid
	echo 3\) Eggnogg
	echo 93\) Limbo
	echo 94\) Lone Survivor
	echo 95\) Minecraft
	echo 96\) Psychonauts
	echo 97\) Amnesia
	echo "99) None, give me my gamepad mode back."
	read userinput
fi

# Use basic logic to determine which module to load
if [ "$userinput" = 1 -o "$userinput" = "vvvvvv" -o "$userinput" = "Vvvvvv" -o "$userinput" = "v" -o "$userinput" = "V" ]
then
	echo "Your controller will now be configured for vvvvvv."
	echo
	cd modules 
	./vvvvvv.sh
elif [ "$userinput" = 2 -o "$userinput" = "Braid" -o "$userinput" = "braid" ]
then
	echo "Your controller will now be configured for Braid."
	echo
	cd modules 
	./braid.sh
elif [ "$userinput" = 3 -o "$userinput" = "Eggnogg" -o "$userinput" = "eggnogg" -o "$userinput" = "egg" -o "$userinput" = "E" -o "$userinput" = "e" ]
then
	echo "Your controllerS will now be configured for eggnogg."
#Different types of controllers could be configured, but it's not my case so I won't do it ;)
	echo
	cd modules 
	./eggnogg.sh
elif [ "$userinput" = 93 -o "$userinput" = "Limbo" -o "$userinput" = "limbo" ]
then
	echo "Your controller will now be configured for Limbo."
	echo
	cd modules 
	./limbo.sh
elif [ "$userinput" = 94 -o "$userinput" = "Lone Survivor" -o "$userinput" = "lone survivor" ]
then
	echo "Your controller will now be configured for Lone Survivor"
	echo
	cd modules 
	./lonesurvivor.sh
elif [ "$userinput" = 95 -o "$userinput" = "Minecraft" -o "$userinput" = "minecraft" ]
then
	echo "Your controller will now be configured for Minecraft."
	echo
	cd modules 
	./minecraft.sh
elif [ "$userinput" = 96 -o "$userinput" = "Psychonauts" -o "$userinput" = "psychonauts" ]
then
	echo "Your controller will now be configured for Psychonauts."
	echo
	cd modules 
	./psychonauts.sh
elif [ "$userinput" = 97 -o "$userinput" = "Amnesia" -o "$userinput" = "amnesia" ]
then
	echo "Your controller will now be configured for Amnesia."
	echo
	cd modules 
	./amnesia.sh
elif [ "$userinput" = 99 ]
then
	echo "Your controller will now be returned to a normal gamepad."
	cd modules
	./xpad.sh
else
	echo $userinput → that is not a valid choice.
fi
