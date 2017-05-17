#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

ROOT=/etc/nixos

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

echo ""
echo -e "${RED}## ${GREEN}Configuring proxy${NC}"
echo ""
echo -n -e "${GREEN}Domain:${NC}   "
read domain
echo -n -e "${GREEN}Username:${NC} "
read user
echo -n -e "${GREEN}Password:${NC} "
read -s password
echo ""

echo ""
echo -e "${RED}## ${GREEN}Applying auxiliary proxy${NC}"
echo ""

spid=$(ps aux | grep "^cntlm" | gawk '{print $2}')
if [ -z ${spid+x} ]; then
  systemctl start cntlm
fi
sleep 5
cntlm=$(ps aux | grep "^cntlm.*" | gawk '{print $11}')
config=$(ps aux | grep "^cntlm.*" | gawk '{print $15}')
if [ -z ${cntlm+x} ]; then
  echo "ERROR: cannot detect cntlm"
  exit 1
fi
if [ -z ${config+x} ]; then
  echo "ERROR: cannot detect cntlm configuration"
  exit 1
fi
systemctl stop cntlm

cp -vf $config $HOME/cntlm.config
exit_code=$?
if [ "$exit_code" -ne 0 ]; then
  echo "ERROR: cannot copy aux proxy configuration"
  exit $exit_code
fi

sed -i "s/Username.*/Username $user/" "$HOME/cntlm.config"
sed -i "s/Password.*/Password $password/" "$HOME/cntlm.config"
sed -i "s/Domain .*/Domain $domain/" "$HOME/cntlm.config"

$cntlm -c $HOME/cntlm.config
exit_code=$?
if [ "$exit_code" -ne 0 ]; then
  echo "ERROR: cannot start aux proxy"
  exit $exit_code
fi

pid=$(ps aux | grep "[c]ntlm" | gawk '{print $2}')
echo "Auxiliary CNTLM pid: $pid"

echo ""
echo -e "${RED}## ${GREEN}Applying configuration${NC}"
echo ""

sed -i "s/username = \".*\";/username = \"$user\";/" "$ROOT/networking.nix"
sed -i "s/password = \".*\";/password = \"$password\";/" "$ROOT/networking.nix"
sed -i "s/domain = \".*\";/domain = \"$domain\";/" "$ROOT/networking.nix"

nixos-rebuild boot
exit_code=$?
if [ "$exit_code" -ne 0 ]; then
  echo "ERROR: cannot apply configuration"
  exit $exit_code
fi

echo ""
echo -e "${RED}## ${GREEN}Killing auxiliary proxy${NC}"
echo ""

if [ ! -z ${pid+x} ]; then
  kill -9 $pid
fi
rm -f $HOME/cntlm.config

echo ""
echo -e "${RED}## ${GREEN}Starting proxy${NC}"
echo ""

nixos-rebuild switch
exit_code=$?
if [ "$exit_code" -ne 0 ]; then
  echo "ERROR: cannot apply configuration"
  exit $exit_code
fi

echo ""
echo -e "${RED}## ${GREEN}Cleanup${NC}"
echo ""

nix-collect-garbage -d
