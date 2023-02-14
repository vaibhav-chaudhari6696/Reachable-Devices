#!/bin/bash

# Define the remote host and user
REMOTE_HOST=192.168.2.100
REMOTE_USER=vaibhav

# Define the command to run on the remote host
REMOTE_COMMAND='wmic os list brief'

# Connect to the remote host and run the command
info1=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

REMOTE_COMMAND='WMIC LOGICALDISK where drivetype!=4 get deviceid, description, volumename'
info2=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

REMOTE_COMMAND='WMIC BIOS get serialnumber'
info3=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

echo "$info1"
echo "$info2"
echo "$info3"
echo "$info1" > "$REMOTE_HOST.txt"
echo "$info2" >> "$REMOTE_HOST.txt"
echo "$info3" >> "$REMOTE_HOST.txt"





