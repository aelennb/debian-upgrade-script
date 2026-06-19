#!/bin/bash
set -e
sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list.d/*.list 2>/dev/null || true
sudo apt update
sudo apt upgrade --without-new-pkgs -y
sudo apt full-upgrade -y
echo "Debian 13 升级完成，请重启。"
