#!/usr/bin/expect

spawn git pull

expect "Username" {send "ltorres@ingenieria.uner.edu.ar\r"}
expect "Password" {send "Oaf/802.701dC\r"}

interact
