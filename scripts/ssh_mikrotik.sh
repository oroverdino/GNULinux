#!/usr/bin/expect

spawn ssh admin@192.168.89.1

expect "password:" {send "AlglpC/A\r"}

interact
