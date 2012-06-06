#!/bin/bash

# This script is used by teamcity to retrieve the shotcut script and run it
# Author: Brian Matherly
# License: GPL2

set -o nounset
set -o errexit

# Get Script
wget --no-check-certificate http://github.com/mltframework/shotcut/raw/master/scripts/build-shotcut.sh
chmod 755 build-shotcut.sh
echo 'INSTALL_DIR="$(pwd)/shotcut"' >> build-shotcut.conf
echo 'SOURCE_DIR="$(pwd)/src"' >> build-shotcut.conf

# Run Script
./build-shotcut.sh $@

# Cleanup
rm -Rf src
rm *.sh
rm *.conf
