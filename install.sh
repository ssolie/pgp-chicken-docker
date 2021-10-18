#!/usr/bin/expect
#
# This script drives the PGP install script and answers all
# the questions.
#
# After setup, the pgp executable can be used to encode
# any file using the beta4ups public key.

# Overall timeout in case things go wrong.
set timeout 2

# Key strokes need to be slowed down to pretend a human is typing.
set send_slow {1 .01}

spawn "./install-pgp.sh"

# Installing the beta4ups public key.
expect "Do you want to certify any of these keys yourself (y/N)?" { send "N\n" }

# Encrypting a file for the first time.
expect "on your keyboard until you hear the beep:" {send -s "abcdefghijklmnopqrstuvwx" }
expect "Are you sure you want to use this public key (y/N)?" { send "y\n" }

interact
