#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ "${1:-}" == "--global" ]]; then
  DEST="${HOME}/.gemini/config/skills"
else
  DEST="${ROOT}/.agents/skills"
fi

python3 "${ROOT}/scripts/sync-codex-skills.py"

mkdir -p "${DEST}"

for skill_dir in "${ROOT}/codex-skills"/*; do
  if [[ -d "${skill_dir}" ]]; then
    skill_name="$(basename "${skill_dir}")"
    rm -rf "${DEST:?}/${skill_name}"
    cp -R "${skill_dir}" "${DEST}/${skill_name}"
  fi
done

echo "Installed Antigravity skills to ${DEST}"
if [[ "${1:-}" == "--global" ]]; then
  echo "Mode: Global (~/.gemini/config/skills)"
else
  echo "Mode: Project (.agents/skills)"
  echo 'Tip: Run "./scripts/install-antigravity-skills.sh --global" for global installation across all projects.'
fi
