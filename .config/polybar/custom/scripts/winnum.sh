#!/bin/sh

total=$(bspc query -N -n .window -d focused | wc -l)

if [ $total -eq 0 ]
    then
        number=0
        string=""
    else
        number=$(bspc query -N -n .window -d focused | grep -n $(bspc query -N -n) | cut -f1 -d:)
        string="($number/$total)"
fi

echo $string
