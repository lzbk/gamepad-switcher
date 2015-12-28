#!/bin/bash

# Define the default gamepad module name
module=xpad

# Check if the module is already loaded, if so, remove it and run the xboxdrv module
if lsmod | grep -q "^$module "
then sudo rmmod xpad
fi

if [ -z "$padconf" ]
then
	echo -e "$prompt"Choose controls — attack with:"$normal"
	echo -e "$choice"1"$info"\) Right "$choice"Stick"$info"
	echo -e "$choice"2"$info"\) "$choice"Button"$info"s"$answer"
	read padconf
fi


if [ "$padconf" = 1 -o "$padconf" = "Stick" -o "$padconf" = "stick" -o "$padconf" = "s" -o "$padconf" = "S" ]
then
	echo -e "$info"Attack with right stick"$normal"
	sudo xboxdrv$pad -c bindingofisaacS.xboxdrv -s --led 2
elif [ "$padconf" = 2 -o "$padconf" = "Buttons" -o "$padconf" = "buttons" -o "$padconf" = "Button" -o "$padconf" = "button" -o "$padconf" = "b" -o "$padconf" = "B" ]
then
	echo -e "$info"Attack with the buttons + triggers"$normal"
	echo 
	sudo xboxdrv$pad -c bindingofisaacB.xboxdrv -s --led 2
else
	echo -e $info$padconf →$mistake that is not a valid choice.
fi
printf $normal