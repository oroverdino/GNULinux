#!/usr/bin/expect

spawn git pull

expect "Username" {send "ltorres@ingenieria.uner.edu.ar\r"}

interact
