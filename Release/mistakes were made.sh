#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")" || exit

CurrentRelease="$(./Library/gh-release-list-latest.sh)"
NextRelease="$(./Library/get\ next\ radiograph\ release\ number.sh "$CurrentRelease" Right)"
echo "Previous Radiograph release number: $CurrentRelease"
echo "Next Radiograph release number: $NextRelease"
while true; do
    read -rp "Did we make a mistake? ($NextRelease)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Alerting clients."
echo "Creating Radiograph release number $NextRelease..."
printf "%s\n" '' hc| gh release create "$NextRelease" -t "$NextRelease"
echo "Fetching from origin..."
git fetch
