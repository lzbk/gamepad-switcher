#!/bin/bash

# Check if the gamepad module is loaded, if not, load it.
module=xpad
if lsmod | grep -q "^$module "
then echo "Xpad already loaded."
else sudo modprobe xpad
echo "Controller has been returned to normal function."
echo
fi
