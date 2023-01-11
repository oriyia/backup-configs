#!/usr/bin/env bash

current_date=$(date)
separator="-----------------------"
itog="$separator$current_date$separator"

cp -f /home/oriyia/.config/alacritty/alacritty.yml ~/code/bash_scripts/configs_backup/configs/alacritty/ &&
    echo '+++++ alacritty.yml' >> results.txt ||
    { echo '----- alacritty.aml' >> results.txt ; exit 1 ; }

echo -e "\n$itog" >> results.txt
