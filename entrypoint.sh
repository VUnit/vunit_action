#!/bin/sh -l

set -eu

run_file="$1"

python3 "$run_file"
