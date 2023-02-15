#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

rm -f /tmp/platform-tools.zip
wget -O /tmp/platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
echo
unzip -o -j /tmp/platform-tools.zip -d /usr/local/bin

echo
echo Platform Tools has been successfully installed
echo

rm -f /tmp/platform-tools.zip
exit 0
