#!/bin/bash

if [[ "${0}" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "\033[1;31mError\033[0m Usage: bash ${0}"
    return 1 &>/dev/null
fi

readonly R="\033[31m"
readonly G="\033[32m"
readonly Y="\033[33m"
readonly E="\033[0m"

LET_SHELL_PID_0=$(pstree -p | grep -E "bash")
LET_SHELL_PID_1=$(pstree -p | grep -E "zsh")
LET_PID=$$

echo -e "[${G}SHELL PID LIST${E}]"
echo -e "${LET_SHELL_PID_0}"
echo -e "${LET_SHELL_PID_1}"
echo -e "[${Y}CURRENT BASH PID${E}]"
echo -e "${LET_PID}"
sleep 5

export http_proxy=http://127.0.0.1:7897
export https_proxy=http://127.0.0.1:7897
export all_proxy=socks5://127.0.0.1:7897

echo -e "${R}PROXY SOCKES5 ${Y}:${E} ${all_proxy}"
echo -e "${R}PROXY HTTPS   ${Y}:${E} ${https_proxy}"
echo -e "${R}PROXY HTTP    ${Y}:${E} ${http_proxy}"
ls -lh ~/.cache/paru/clone/
rm -rf ~/.cache/paru/clone/*
echo -e "${Y}REMOVE CACHES ${Y}:${R} ~/.cache/paru/clone/* ${E}"
sleep 2

if [[ "--sc" == "${1}" ]]; then
    sudo pacman -Sc --noconfirm
fi
sudo cachyos-rate-mirrors
sudo pacman -Syyu --noconfirm && paru -Syyu --noconfirm

history -a &>/dev/null
rm -rf ~/.bash_history

exit 0
