#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")" || exit

CurrentRelease="$(./Library/gh-release-list-latest.sh)"
NextRelease="$(./Library/get\ next\ radiograph\ release\ number.sh "$CurrentRelease" Middle)"
echo "Previous Radiograph release number: $CurrentRelease"
echo "Next Radiograph release number: $NextRelease"
while true; do
    read -rp "Do any previous Radiograph release number example tests fail? ($NextRelease)" yn
    case $yn in
        [Yy]* ) exit;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Declaring that no previous Radiograph release number example test(s) fail."
echo "Creating Radiograph release number $NextRelease..."
printf "%s\n" '' hc| gh release create "$NextRelease" -t "$NextRelease"
echo "Fetching from origin..."
git fetch
