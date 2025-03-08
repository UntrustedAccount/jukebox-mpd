#!/usr/bin/env bash

PORT=42069
FILE="./queue"

echo "Running controller"

./controller.sh &

echo "Listening on port $PORT"

nc -kl "$PORT" | while read input
do
	echo "$input"
	echo "$input" >> "$FILE"
done
