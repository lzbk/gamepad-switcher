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
sudo xboxdrv$pad -s -i 0 --led 2 &
echo "controller1 is being handled by process number $!"
if [ -f "$workingDirectory$killProcessesScript" ]
then 
    echo "sudo kill $!" > "$workingDirectory$killProcessesScript"
fi
sudo xboxdrv$pad -s -i 1 --led 3 &
echo "controller2 is being handled by process number $!"
if [ -f "$workingDirectory$killProcessesScript" ]
then 
    echo "sudo kill $!" >> "$workingDirectory$killProcessesScript"
fi