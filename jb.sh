#!/bin/bash

PORT=42069
HOST=localhost

echo "$1" | nc -c "$HOST" "$PORT"
