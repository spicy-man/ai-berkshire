#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "[AI Berkshire] 未检测到 upstream 远端，正在自动添加 upstream (https://github.com/xbtlin/ai-berkshire.git)..."
  git remote add upstream https://github.com/xbtlin/ai-berkshire.git
fi

echo "[AI Berkshire] 正在从 upstream (xbtlin/ai-berkshire) 获取最新更新..."
git fetch upstream

echo "[AI Berkshire] 正在同步技能、工具及核心框架文件..."
git checkout upstream/main -- skills codex-skills codex-prompts tools scripts docs tests assets CLAUDE.md AGENTS.md reports/_index

if command -v python3 >/dev/null 2>&1; then
  PY="python3"
elif command -v python >/dev/null 2>&1; then
  PY="python"
else
  echo "[警告] 未找到 Python，跳过 Codex 技能重新同步验证。"
  PY=""
fi

if [ -n "$PY" ]; then
  echo "[AI Berkshire] 验证/同步 Codex 技能与提示词..."
  $PY scripts/sync-codex-skills.py
  if [ -f "$ROOT/scripts/sync-codex-prompts.py" ]; then
    $PY scripts/sync-codex-prompts.py
  fi
fi

if [ -d "$ROOT/.agents/skills" ] && [ -f "$ROOT/scripts/install-antigravity-skills.sh" ]; then
  echo "[AI Berkshire] 更新 Antigravity 项目技能..."
  bash "$ROOT/scripts/install-antigravity-skills.sh"
fi

echo ""
echo "========================================================"
echo "[AI Berkshire] 框架与技能已成功同步到最新版本！"
echo "注意：reports/ 与 实盘记录/ 中的个人数据完全保留，不受任何影响。"
echo "========================================================"
echo ""
git status -s
