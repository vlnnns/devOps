#!/bin/bash

path=""
extension=""

while getopts ":p:e:" opt; do
  case ${opt} in
    p )
      path=$OPTARG
      ;;
    e )
      extension=$OPTARG
      ;;
    \? )
      echo "Incorrect key: -$OPTARG" >&2
      exit 1
      ;;
    : )
      echo "Key -$OPTARG needs argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$path" ] || [ -z "$extension" ]; then
  echo "Using: $0 -p <path> -e <extension>"
  exit 1
fi

count=$(find "$path" -type f -name "*.$extension" | wc -l)

echo "Кількість файлів з розширенням .$extension у директорії $path: $count"

