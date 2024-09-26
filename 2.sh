#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Using: $0 <path> <text>"
	exit 1
fi

path=$1
text=$2

grep -r "$text" "$path"
