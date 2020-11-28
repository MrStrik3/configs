#!/bin/bash

# Requires "acpi" command

BAT=$(acpi -b | grep -E -o '[0-9]{0,3}%')

# Full and short texts

batChargingIcon1="" # Empty
batChargingIcon2=""
batChargingIcon3=""
batChargingIcon4=""
batChargingIcon5="" # Full
batIcon1="" # Empty
batIcon2=""
batIcon3=""
batIcon4=""
batIcon5="" # Full

isDischarging=$(acpi -b | grep Discharging | wc -l)

# if [[ $isDischarging -eq 0 ]]; then

#   batIcon1="$batChargingIcon1"
#   batIcon2="$batChargingIcon2"
#   batIcon3="$batChargingIcon3"
#   batIcon4="$batChargingIcon4"
#   batIcon5="$batChargingIcon5"
# fi


if [[ ${BAT%?} -ge 80 ]]; then
  batIcon=$batIcon5
else
  if [[ ${BAT%?} -ge 60 ]]; then
    batIcon=$batIcon4
  else
    if [[ ${BAT%?} -ge 40 ]]; then
        batIcon=$batIcon3
    else
      if [[ ${BAT%?} -ge 20 ]]; then
        batIcon=$batIcon2
      else
        batIcon=$batIcon1
      fi
    fi
  fi
fi

echo "$batIcon $BAT"
echo "$batIcon $BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
