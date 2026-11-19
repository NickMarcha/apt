#!/bin/sh
# Adds the Bragi apt repository to a Debian trixie box (Raspberry Pi OS on arm64, or amd64),
# then installs Bragi (and the headless Deskflow server it recommends).
#
#   curl -fsSL https://nickmarcha.github.io/apt/install.sh | sh
#
# Asks for sudo. Read it first if you like; it's short.
set -eu

BASE=https://nickmarcha.github.io/apt
KEYRING=/usr/share/keyrings/bragi-archive-keyring.gpg

curl -fsSL "$BASE/bragi-archive-keyring.gpg" | sudo tee "$KEYRING" >/dev/null
sudo tee /etc/apt/sources.list.d/bragi.sources >/dev/null <<EOF
Types: deb
URIs: $BASE
Suites: trixie
Components: main
Signed-By: $KEYRING
EOF

sudo apt-get update
sudo apt-get install -y bragi
echo
echo "Bragi is installed and running as a user service (systemctl --user status bragi)."
echo "Updates come with the usual: sudo apt update && sudo apt upgrade"
