#!/usr/bin/env bash

phoneNumbers=(
	# list of phone numbers
)

for phoneNumber in "${phoneNumbers[@]}"; do
	echo "wa.me/62${phoneNumber:1:${#phoneNumber}}"
done

