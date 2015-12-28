#!/bin/bash
# This is a script designed to switch between several preconfigured layouts as defined by the xboxdrv settings held within modules.
# 2 parameters can be used : 1 → x for xbox controller, p for ps3
#                            2 → name of the game as suggested in menu

#configuration
	#colors
prompt='\033[1;34;40m'
answer='\033[0;32m'
info='\033[0;33m'
choice='\033[1;37;40m'
mistake='\033[0;31m'
normal='\033[0m'
export prompt
export answer
export info
export choice
export mistake
export normal
	#where are we ?
export workingDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
#(thanks http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in)
cd $workingDirectory
. ./config.sh
echo "Proove you are root…"
sudo sleep 0.1
if [ -e "$killProcessesScript" ]
then
	echo -e "$prompt There seems to be (a) running instance(s) of the game controller, do you want to brutally kill the processes? $info($choice""Y$info/$choice""n$info)$answer"
	echo -e "$info I'm not sure what it does if you don't…$answer"
	read userinput
	if [ "$userinput" = "Y" -o "$userinput" = "y" ]
	then
		sh $killProcessesScript
		rm $killProcessesScript
		sleep 1
	fi
fi
printf $normal
if [ $# = 0 ]
then
	echo -e "$prompt($choice""X$prompt)box or ($choice""P$prompt)S3 ?$answer"
	read userinput
	printf $normal
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
	echo -e "$mistake""Whatever"
fi
export pad

if [ $# -gt 1 ]
then
	userinput=$2
else
	# Give a list of available games
	echo -e "$prompt"What game would you like to play?$info
	echo -e "$choice"1"$info"\) "$choice"v"$info"vvvvv
	echo -e "$choice"2"$info"\) "$choice"B"$info"raid
	echo -e "$choice"3"$info"\) "$choice"E"$info"ggnogg
	echo -e "$choice"4"$info"\) "$choice"M"$info"etal Slug
	echo -e "$choice"5"$info"\) "$choice"D"$info"ustforce
	echo -e "$choice"6"$info"\) "$choice"H"$info"otline "$choice"M"$info"iami "$choice"2"$info": Wrong Number
	echo -e "$choice"7"$info"\) The "$choice"B"$info"inding "$choice"o"$info"f "$choice"I"$info"saac: Wrath of the Lamb
	echo -e "$choice"93"$info"\) Limbo
	echo -e "$choice"94"$info"\) Lone Survivor
	echo -e "$choice"95"$info"\) Minecraft
	echo -e "$choice"96"$info"\) Psychonauts
	echo -e "$choice"97"$info"\) Amnesia
	echo -e "$choice"99"$info"\) "None, give me my gamepad mode back.$answer"
	read userinput
fi
printf $normal

# Use basic logic to determine which module to load
if [ "$userinput" = 1 -o "$userinput" = "vvvvvv" -o "$userinput" = "Vvvvvv" -o "$userinput" = "v" -o "$userinput" = "V" ]
then
	echo "Your controller will now be configured for vvvvvv."
	echo
	cd modules 
	./vvvvvv.sh
elif [ "$userinput" = 2 -o "$userinput" = "Braid" -o "$userinput" = "braid" -o "$userinput" = "B" -o "$userinput" = "b" ]
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
elif [ "$userinput" = 4 -o "$userinput" = "MetalSlug" -o "$userinput" = "metalslug" -o "$userinput" = "metal" -o "$userinput" = "Metal" -o "$userinput" = "m" -o "$userinput" = "M" ]
then
	echo "Your controllerS will now be configured for Metal Slug."
	echo
	cd modules 
	./metalslug.sh
elif [ "$userinput" = 5 -o "$userinput" = "Dustforce" -o "$userinput" = "dustforce" -o "$userinput" = "dust" -o "$userinput" = "Dust" -o "$userinput" = "d" -o "$userinput" = "D" ]
then
	echo "Your controllerS will now be configured for Dust Force."
	echo
	cd modules 
	./dustforce.sh
elif [ "$userinput" = 6 -o "$userinput" = "Hotline" -o "$userinput" = "Miami" -o "$userinput" = "hotline" -o "$userinput" = "miami" -o "$userinput" = "hm2" -o "$userinput" = "HM2" ]
then
	echo "Your controller will now be configured for Hotline Miami 2: Wrong Number."
	echo
	cd modules 
	./hotlinemiami2.sh
elif [ "$userinput" = 7 -o "$userinput" = "Binding" -o "$userinput" = "binding" -o "$userinput" = "Isaac" -o "$userinput" = "isaac" -o "$userinput" = "boi" -o "$userinput" = "BoI" -o "$userinput" = "BOI" ]
then
	echo "Your controller will now be configured for The Binding of Isaac: Wrath of the Lamb."
	cd modules
	padconf=$3
	export padconf
	./bindingofisaac.sh
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
