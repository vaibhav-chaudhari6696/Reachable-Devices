#!/bin/bash

host=$1
username=$2
password=$3
osname=$4


if [[ $osname == "windows" ]];
then
    osinfo=$(sshpass -p "$password" ssh "$username@$host" "wmic os get Caption,Version,BuildNumber,OSArchitecture,SerialNumber")
    netinfo=$(sshpass -p "$password" ssh "$username@$host" "wmic nicconfig get description, IPAddress, MACAddress")
    diskinfo=$(sshpass -p "$password" ssh "$username@$host" "wmic logicaldisk get deviceid,volumename,size,filesystem")
    meminfo=$(sshpass -p "$password" ssh "$username@$host" "wmic memorychip get capacity,manufacturer,speed,partnumber")
    cpu=$(sshpass -p "$password" ssh "$username@$host" "wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed")
    
    echo -e "\nOS Info:"
    echo "$osinfo"

    echo -e "\nNet Card:"
    echo "$netinfo"
    
    echo -e "\nDisk Info:"
    echo "$diskinfo"
    
    echo -e "\nMemory Info:"
    echo "$meminfo"

    echo -e "\nCPU Info:"
    echo "$cpu"


    echo -e "\nOS Info:">"$host.txt"
    echo "$osinfo">>"$host.txt"

    echo -e "\nNet Card:">>"$host.txt"
    echo "$netinfo">>"$host.txt"
    
    echo -e "\nDisk Info:">>"$host.txt"
    echo "$diskinfo">>"$host.txt"
    
    echo -e "\nMemory Info:">>"$host.txt"
    echo "$meminfo">>"$host.txt"

    echo -e "\nCPU Info:">>"$host.txt"
    echo "$cpu">>"$host.txt"


elif [[ $osname == "linux" ]];then
    osinfo=$(sshpass -p "$password" ssh "$username@$host" "cat /etc/*-release")
    netinfo=$(sshpass -p "$password" ssh "$username@$host" "ip address show")
    diskinfo=$(sshpass -p "$password" ssh "$username@$host" "lsblk")
    meminfo=$(sshpass -p "$password" ssh "$username@$host" "free -h")
    cpu=$(sshpass -p "$password" ssh "$username@$host" "lscpu")

    echo -e "\nOS Info:"
    echo "$osinfo"

    echo -e "\nNet Card:"
    echo "$netinfo"
    
    echo -e "\nDisk Info:"
    echo "$diskinfo"
    
    echo -e "\nMemory Info:"
    echo "$meminfo"

    echo -e "\nCPU Info:"
    echo "$cpu"


    echo -e "\nOS Info:">"$host.txt"
    echo "$osinfo">>"$host.txt"

    echo -e "\nNet Card:">>"$host.txt"
    echo "$netinfo">>"$host.txt"
    
    echo -e "\nDisk Info:">>"$host.txt"
    echo "$diskinfo">>"$host.txt"
    
    echo -e "\nMemory Info:">>"$host.txt"
    echo "$meminfo">>"$host.txt"

    echo -e "\nCPU Info:">>"$host.txt"
    echo "$cpu">>"$host.txt"


fi


