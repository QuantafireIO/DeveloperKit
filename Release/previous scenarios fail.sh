#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")" || exit

CurrentRelease="$(./Library/gh-release-list-latest.sh)"
NextRelease="$(./Library/get\ next\ radiograph\ release\ number.sh "$CurrentRelease" Left)"
echo "Previous Radiograph release number: $CurrentRelease"
echo "Next Radiograph release number: $NextRelease"
while true; do
    read -rp "Do any previous Radiograph release number example tests fail? ($NextRelease)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Declaring that one or more previous Radiograph release number example tests fail."
echo "Creating Radiograph release number $NextRelease..."
printf "%s\n" '' hc| gh release create "$NextRelease" -t "$NextRelease"
echo "Fetching from origin..."
git fetch
