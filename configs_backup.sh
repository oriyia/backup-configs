#!/usr/bin/env bash

# создать резервную копию важных конфигов

separator="-----------------------"
itog="${separator}$(date)${separator}"

declare -A list_directories=(
["alacritty"]="/home/oriyia/.config/alacritty/"
["zsh"]="${HOME}/.zshrc"
["i3"]="${HOME}/.config/i3/config"
["betterlockscreen"]="home/oriyia/.config/betterlockscreenrc"
["nvim"]="${HOME}/.config/nvim/"
["bash_history"]="/home/oriyia/.bash_history"
["bashrc"]="/home/oriyia/.bashrc"
["bash_profile"]="/home/oriyia/.profile"
["python_history"]="/home/oriyia/.python_history"
["xinitrc"]="/home/oriyia/.xinitrc"
["xmodmap"]="/home/oriyia/.Xmodmap"
["xprofile"]="/home/oriyia/.xprofile"
["xresources"]="/home/oriyia/.Xresources")


target="${PWD}/saved_configs/"

for key in "${!list_directories[@]}"
do
    if [[ -d ${list_directories[$key]} ]]
    then
        if cp -aT "${list_directories[$key]}" "${target}${key}"
        then
            echo "+++++ ${key}" >> results.txt
        else
            echo "----- ${key}" >> results.txt
        fi
    else
        mkdir "${target}${key}/" &> /dev/null
        if cp -a "${list_directories[$key]}" "${target}${key}/"
        then
            echo "+++++++ ${key}" >> results.txt
        else
            echo "---------- ${key}" >> results.txt
        fi
    fi
done

echo -e "\n${itog}" >> results.txt
