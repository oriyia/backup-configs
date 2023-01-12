#!/usr/bin/env bash

current_date=$(date)
separator="-----------------------"
itog="$separator$current_date$separator"

outgoing_path="/home/oriyia/.config/alacritty/alacritty.yml"
target_path="~/code/bash_scripts/configs_backup/saved_configs/alacritty/"

cp -f $outgoing_path $target_path &&
    echo '+++++ alacritty.yml' >> results.txt ||
    { echo '----- alacritty.yml' >> results.txt ; exit 1 ; }

echo -e "\n$itog" >> results.txt
