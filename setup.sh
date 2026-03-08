#!/bin/bash
# setup.sh
# Run once from the project root after adding agent_directory as a submodule.
# Scaffolds the project with everything needed to start working in Claude Code.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Setting up agency framework..."

# Verify we're running from the right place
if [ ! -f "$SCRIPT_DIR/CLAUDE.md" ]; then
  echo "Error: Run this script from within the .agency/ submodule directory,"
  echo "or as: bash .agency/setup.sh from the project root."
  exit 1
fi

# Initialize submodule if content is missing
if [ ! -f "$SCRIPT_DIR/agents/orchestrator.md" ]; then
  echo "Initializing submodule..."
  cd "$PROJECT_ROOT"
  git submodule update --init --recursive
fi

# ── 1. Commands symlink ───────────────────────────────────────────────────────

mkdir -p "$PROJECT_ROOT/.claude"

if [ -L "$PROJECT_ROOT/.claude/commands" ]; then
  echo "✓ Commands symlink already exists"
elif [ -d "$PROJECT_ROOT/.claude/commands" ]; then
  echo "Warning: .claude/commands already exists as a directory (not a symlink)."
  echo "  Back it up and remove it, then re-run this script to use agency commands."
else
  ln -sf "../.agency/.claude/commands" "$PROJECT_ROOT/.claude/commands"
  echo "✓ Commands symlinked"
fi

# ── 2. CLAUDE.md ─────────────────────────────────────────────────────────────

if [ -f "$PROJECT_ROOT/CLAUDE.md" ]; then
  echo "✓ CLAUDE.md already exists (skipping)"
else
  cp "$SCRIPT_DIR/templates/project-CLAUDE.md" "$PROJECT_ROOT/CLAUDE.md"
  echo "✓ CLAUDE.md created from template"
fi

# ── 3. GitHub PR template ─────────────────────────────────────────────────────

mkdir -p "$PROJECT_ROOT/.github"

if [ -f "$PROJECT_ROOT/.github/PULL_REQUEST_TEMPLATE.md" ]; then
  echo "✓ .github/PULL_REQUEST_TEMPLATE.md already exists (skipping)"
else
  cp "$SCRIPT_DIR/templates/github/pull_request_template.md" "$PROJECT_ROOT/.github/PULL_REQUEST_TEMPLATE.md"
  echo "✓ .github/PULL_REQUEST_TEMPLATE.md created"
fi

# ── Done ──────────────────────────────────────────────────────────────────────

echo ""
echo "Agency framework ready."
echo ""
echo "Next steps:"
echo "  1. Commit the setup:"
echo "     git add . && git commit -m 'Initialize agency framework'"
echo "  2. Open Claude Code and run /new-project"
