#!/usr/bin/env bash

phoneNumbers=(
	# ...
)

for phoneNumber in "${phoneNumbers[@]}"; do
	echo "wa.me/62${phoneNumber:1:${#phoneNumber}}"
	printf "\n"
done

