#!/usr/bin/expect -f

set timeout 5
set host [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]

spawn ssh $username@$host
expect "password:"
send "$password\r"

expect "$ "
send "cat /etc/*-release\r"

expect "$ "
send "ip address show\r"

expect "$ "
send "lsblk\r"

expect "$ "
send "free -h\r"

expect "$ "
send "lscpu\r"

expect "$ "
send "exit\r"

interact
