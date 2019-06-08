#!/usr/bin/expect

spawn ssh sol@192.168.89.61

expect "password:" {send "22"}

interact
