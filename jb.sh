#!/bin/bash

HOST=localhost
PORT=1234

echo "$1" | nc "$HOST" "$PORT"
