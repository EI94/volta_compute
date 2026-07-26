#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

interval_seconds="${1:-60}"
mkdir -p metrics
output_file="metrics/gpu-$(date -u +%Y%m%dT%H%M%SZ).csv"

printf '%s\n' 'timestamp_utc,pilot_id,gpu_name,gpu_uuid,utilization_gpu_pct,utilization_memory_pct,memory_used_mib,memory_total_mib,power_draw_w,power_limit_w,temperature_c' > "$output_file"

pilot_id="unknown"
if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
  pilot_id="${PILOT_ID:-unknown}"
fi

printf 'Writing GPU telemetry to %s every %s seconds. Stop with Ctrl-C.\n' "$output_file" "$interval_seconds"

while true; do
  timestamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  nvidia-smi \
    --query-gpu=name,uuid,utilization.gpu,utilization.memory,memory.used,memory.total,power.draw,power.limit,temperature.gpu \
    --format=csv,noheader,nounits | \
  while IFS= read -r row; do
    printf '%s,%s,%s\n' "$timestamp" "$pilot_id" "$row" >> "$output_file"
  done
  sleep "$interval_seconds"
done
