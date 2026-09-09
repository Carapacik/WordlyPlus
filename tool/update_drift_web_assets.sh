#!/bin/sh
set -eu

drift_version='2.34.4'
worker_sha256='104bc207d4a3a0b70fc249fcd91d72b558cf7a8677fe49b41cafffe22a5144f4'
wasm_sha256='13d3f11d05b39ba0618a7115fb41640a5d48b6300f5d3f325f554b42bd6688a4'
project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
download_dir=$(mktemp -d)
trap 'rm -rf "$download_dir"' EXIT HUP INT TERM

curl -fsSL "https://github.com/simolus3/drift/releases/download/drift-${drift_version}/drift_worker.js" \
  -o "$download_dir/drift_worker.js"
curl -fsSL "https://github.com/simolus3/drift/releases/download/drift-${drift_version}/sqlite3.wasm" \
  -o "$download_dir/sqlite3.wasm"

printf '%s  %s\n' "$worker_sha256" "$download_dir/drift_worker.js" | shasum -a 256 -c -
printf '%s  %s\n' "$wasm_sha256" "$download_dir/sqlite3.wasm" | shasum -a 256 -c -
mv "$download_dir/drift_worker.js" "$project_dir/web/drift_worker.js"
mv "$download_dir/sqlite3.wasm" "$project_dir/web/sqlite3.wasm"
