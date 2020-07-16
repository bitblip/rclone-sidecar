#!/bin/sh

rclone copy azArmadous:stationeers /files 

check() {
    while true
    do
        sleep 30
        ls /files/* | entr -d -r -c "rclone sync /files azArmadous:stationeers"
    done
}

check