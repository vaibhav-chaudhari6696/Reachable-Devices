#!/bin/bash

# Define the remote host and user
REMOTE_HOST=192.168.2.100
REMOTE_USER=vaibhav

# Define the command to run on the remote host
REMOTE_COMMAND='wmic os get Caption,Version,BuildNumber,OSArchitecture,SerialNumber'
# Connect to the remote host and run the command
info1=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

REMOTE_COMMAND='wmic nicconfig get description, IPAddress, MACAddress'
info2=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

REMOTE_COMMAND='wmic logicaldisk get deviceid,volumename,size,filesystem'
info3=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")


REMOTE_COMMAND='wmic memorychip get capacity,manufacturer,speed,partnumber'
info4=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

REMOTE_COMMAND='wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed'
info5=$(ssh "$REMOTE_USER@$REMOTE_HOST" "$REMOTE_COMMAND")

echo "$info1"
echo "$info2"
echo "$info3"
echo "$info4"
echo "$info5"

echo "$info1" > "$REMOTE_HOST.txt"
echo "$info2" >> "$REMOTE_HOST.txt"
echo "$info3" >> "$REMOTE_HOST.txt"
echo "$info4" >> "$REMOTE_HOST.txt"
echo "$info5" >> "$REMOTE_HOST.txt"






