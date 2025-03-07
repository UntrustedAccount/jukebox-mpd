#!/bin/bash

PORT=42069
FILE="./queue"

echo "Listening on port $PORT"

while true;
do
	input=$(nc -l -p "$PORT")
	echo "$input" >> "$FILE"
done
