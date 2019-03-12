#!/usr/bin/expect

spawn telnet 192.168.89.1

expect "Login:" {send "admin\r"}
expect "Password:" {send "AlglpC/A\r"}

interact
