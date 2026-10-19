#!/bin/bash
set -euo pipefail

QUERY="${1:?Usage: $0 'PromQL query'}"

curl -fsSG \
  --data-urlencode "query=$QUERY" \
  http://127.0.0.1:9090/api/v1/query | python3 -m json.tool
