#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

[[ -f .env ]] || { echo "Missing .env" >&2; exit 1; }
set -a
# shellcheck disable=SC1091
source .env
set +a

base_url="https://${DOMAIN}"

printf 'Checking model endpoint at %s ...\n' "$base_url"
curl --fail --silent --show-error \
  -H "Authorization: Bearer ${VLLM_API_KEY}" \
  "${base_url}/v1/models" | python3 -m json.tool

printf '\nRunning one deterministic chat completion ...\n'
curl --fail --silent --show-error \
  -H "Authorization: Bearer ${VLLM_API_KEY}" \
  -H "Content-Type: application/json" \
  "${base_url}/v1/chat/completions" \
  -d "{
    \"model\": \"${SERVED_MODEL_NAME}\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"You are a concise infrastructure test assistant.\"},
      {\"role\": \"user\", \"content\": \"Reply with exactly: VOLTA COMPUTE READY\"}
    ],
    \"temperature\": 0,
    \"max_tokens\": 16
  }" | python3 -m json.tool

printf '\nSmoke test completed.\n'
