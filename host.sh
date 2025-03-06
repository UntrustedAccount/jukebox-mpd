#!/bin/bash

PORT=1234
FILE="./queue"

echo "Listening on port $PORT"

while true;
do
	input=$(nc -l "$PORT")
	echo "$input" >> "$FILE"
done
