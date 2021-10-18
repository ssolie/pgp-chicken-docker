#!/bin/sh
#
# Script to install the PGP public key and prepare it for use.
#
# After this runs we can use the pgp executable to encrypt any
# file without user input.
./pgp -ka beta4ups.asc .pgp/pubring.pgp
echo "amiga" > test_file.txt
./pgp -o test_file.pgp -e test_file.txt beta4ups
rm test_file.pgp
rm test_file.txt
