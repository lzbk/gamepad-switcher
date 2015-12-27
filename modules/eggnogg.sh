#!/bin/bash

# Define the default gamepad module name
module=xpad

# Check if the module is already loaded, if so, remove it and run the xboxdrv module
if lsmod | grep -q "^$module "
then sudo rmmod xpad
fi

if [ ! -e "$workingDirectory$killProcessesScript" ]
then
	touch "$workingDirectory$killProcessesScript"
fi

sudo xboxdrv -i 0 $pad -s --led 2 &
echo "controller1 is being handled by process number $!"
if [ -f "$workingDirectory$killProcessesScript" ]
then 
    echo "sudo kill $!" > "$workingDirectory$killProcessesScript"
fi
sudo xboxdrv -i 1 $pad -s --led 3 &
echo "controller2 is being handled by process number $!"
if [ -f "$workingDirectory$killProcessesScript" ]
then 
    echo "sudo kill $!" >> "$workingDirectory$killProcessesScript"
fi
sudo xboxdrv -i 2 $pad -s --led 4 &
echo "controller3 is being handled by process number $!"
if [ -f "$workingDirectory$killProcessesScript" ]
then 
    echo "sudo kill $!" >> "$workingDirectory$killProcessesScript"
fi