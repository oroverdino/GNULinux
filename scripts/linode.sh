#!/usr/bin/expect

spawn ssh leandro@li1249-158.members.linode.com

expect "password:" {send "Linode.leandro\r"}

interact
