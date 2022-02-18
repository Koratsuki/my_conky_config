#!/bin/bash

if ping -c 1 -W 2 $1 > /dev/null; then
    echo '${color green}Up ${color}'
else
    echo '${color red}Down ${color}'
fi
