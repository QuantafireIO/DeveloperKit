#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")" || exit

# break down the version number into it's components
regex="([0-9]+).([0-9]+).([0-9]+)"
if [[ $1 =~ $regex ]]; then
  Left="${BASH_REMATCH[1]}"
  Middle="${BASH_REMATCH[2]}"
  Right="${BASH_REMATCH[3]}"
fi

# check parameter to see which number to increment
if [[ "$2" == "Middle" ]]; then
  Middle=$(echo "$Middle"+1 | bc)
  Right=0
elif [[ "$2" == "Right" ]]; then
  Right=$(echo "$Right"+1 | bc)
elif [[ "$2" == "Left" ]]; then
  Left=$(echo "$Left"+1 | bc)
  Middle=0
  Right=0
else
  echo "usage: ./get next radiograph version number.sh version_number [Left/Middle/Right]"
  exit 255
fi

# echo the new version number
echo "${Left}.${Middle}.${Right}"
