#!/bin/bash
# setup.sh
# Run once from the project root after adding agent_directory as a submodule.
# Sets up the command symlink so Claude Code can find all agent commands.

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

# Create .claude directory in project root if needed
mkdir -p "$PROJECT_ROOT/.claude"

# Symlink commands into project's .claude/
if [ -L "$PROJECT_ROOT/.claude/commands" ]; then
  echo "✓ Commands symlink already exists"
elif [ -d "$PROJECT_ROOT/.claude/commands" ]; then
  echo "Warning: .claude/commands already exists as a directory (not a symlink)."
  echo "If you want to use agency commands, back it up and remove it, then re-run this script."
else
  ln -sf "../.agency/.claude/commands" "$PROJECT_ROOT/.claude/commands"
  echo "✓ Commands symlinked to .agency/.claude/commands"
fi

echo ""
echo "Agency framework ready."
echo ""
echo "Next steps:"
echo "  1. Copy the project CLAUDE.md template:"
echo "     cp .agency/templates/project-CLAUDE.md CLAUDE.md"
echo "  2. Commit the setup:"
echo "     git add . && git commit -m 'Initialize agency framework'"
echo "  3. Open Claude Code and run /new-project"
