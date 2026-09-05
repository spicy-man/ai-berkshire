#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "[AI Berkshire] 正在从 upstream (xbtlin/ai-berkshire) 获取最新更新..."
git fetch upstream

echo "[AI Berkshire] 正在同步技能、工具及核心框架文件..."
git checkout upstream/main -- skills codex-skills codex-prompts tools scripts docs tests assets CLAUDE.md AGENTS.md

if command -v python3 >/dev/null 2>&1; then
  PY="python3"
elif command -v python >/dev/null 2>&1; then
  PY="python"
else
  echo "[警告] 未找到 Python，跳过 Codex 技能重新同步验证。"
  PY=""
fi

if [ -n "$PY" ]; then
  echo "[AI Berkshire] 验证/同步 Codex 技能..."
  $PY scripts/sync-codex-skills.py
fi

echo ""
echo "========================================================"
echo "[AI Berkshire] 框架与技能已成功同步到最新版本！"
echo "注意：reports/ 与 实盘记录/ 中的个人数据完全保留，不受任何影响。"
echo "========================================================"
echo ""
git status -s
