#!/usr/bin/env bash

PORT=42069
HOST=localhost

echo "$1" | nc -N "$HOST" "$PORT"
