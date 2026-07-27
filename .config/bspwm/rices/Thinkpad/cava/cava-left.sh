#! /bin/bash

#bar=" ▁▂▃▄▅▆▇█"
#dict="s/;//g;"

## creating "dictionary" to replace char with bar
#i=1
#while [ $i -lt ${#bar} ]
#do
    #dict="${dict}s/$i/${bar:$i:1}/g;"
    #i=$((i=i+1))
# done

#very clear dict
dict="s/;//g; s/0/ /g; s/1/%{F#00BB00}▁%{F-}/g; s/6/%{F#cdc100}▆%{F-}/g; s/5/five/g; s/2/two/g; s/7/%{F#e5c111}▇%{F-}/g; s/4/%{F#97c000}▄%{F-}/g; s/8/%{F#fbc02d}█%{F-}/g; s/3/%{F#65fe0d}▃%{F-}/g; s/five/%{F#b3c100}▅%{F-}/g; s/two/%{F#53bd00}▂%{F-}/g; "
# write cava config
config_file="$HOME/.config/bspwm/rices/Thinkpad/cava/cava-left"


# read stdout from cava
#cava -p $config_file | while read -r line; do
    #echo $line | sed -E "$dict"
#done
cava -p $config_file | sed -u -E "$dict"
