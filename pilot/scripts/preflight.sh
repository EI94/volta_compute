#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

command -v docker >/dev/null 2>&1 || fail "Docker is not installed."
command -v nvidia-smi >/dev/null 2>&1 || fail "nvidia-smi is not available. Install a supported NVIDIA driver."
[[ -f .env ]] || fail "Missing .env. Copy .env.example to .env and fill the values."

set -a
# shellcheck disable=SC1091
source .env
set +a

for variable in DOMAIN ACME_EMAIL VLLM_API_KEY MODEL_ID SERVED_MODEL_NAME; do
  [[ -n "${!variable:-}" ]] || fail "$variable is empty in .env."
done

if [[ ${#VLLM_API_KEY} -lt 32 ]]; then
  fail "VLLM_API_KEY must be at least 32 characters."
fi

printf '\nNVIDIA status\n'
nvidia-smi --query-gpu=name,uuid,memory.total,driver_version,power.limit,temperature.gpu --format=csv

printf '\nDocker status\n'
docker version --format 'Client: {{.Client.Version}} | Server: {{.Server.Version}}'
printf '\n'

if ! docker info 2>/dev/null | grep -qi nvidia; then
  printf 'WARNING: NVIDIA runtime was not detected in docker info. Verify NVIDIA Container Toolkit before launch.\n' >&2
fi

available_gb=$(df -Pk "$ROOT_DIR" | awk 'NR==2 {printf "%.0f", $4/1024/1024}')
if (( available_gb < 100 )); then
  printf 'WARNING: only %s GB are free. Keep at least 100 GB for images, model cache and logs.\n' "$available_gb" >&2
fi

printf '\nPreflight passed. Next commands:\n'
printf '  docker compose pull\n'
printf '  docker compose up -d\n'
printf '  ./scripts/smoke-test.sh\n'
