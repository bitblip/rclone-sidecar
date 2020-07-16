#!/bin/sh

echo "Performing first time sync"
rclone sync azArmadous:stationeers /files --progress

hash=$(ls -R -l /files | md5sum)


check() {
    echo "Polling /files for changes"
    while true
    do
        sleep 5

        hash2=$(ls -R -l /files | md5sum)

        if [ "$hash" != "$hash2" ]
        then
            echo "File change detected, performing sync"
            rclone sync /files azArmadous:stationeers --progress
            hash=$hash2
        fi
    done
}

check