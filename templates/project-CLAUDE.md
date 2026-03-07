# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this project repository.

## About This Project

[Fill in after running /new-project — project name and one-line description.]

## Agency Framework

This project uses the Agent Directory framework at `.agency/`.

- Agent definitions: `.agency/agents/`
- Shared skills: `.agency/skills/`
- Artifact templates: `.agency/templates/`
- Commands: `.claude/commands/` (symlinked from `.agency/.claude/commands/`)

When acting as any agent, load the relevant definition from `.agency/agents/` before proceeding.

## Project Files

| File / Folder | Purpose |
|---------------|---------|
| `project-brief.md` | Source of truth for all agents. Created by `/new-project`. |
| `decisions.md` | Append-only log of every significant decision made, by whom, and why. |
| `discovery/` | Discovery Team outputs (personas, market analysis, assumption map, CP1) |
| `design/` | Design & Architecture Team outputs (PRD, architecture, backlog, UX flows, CP2) |
| `build/` | Build Team outputs (implementation plan, code standards, QA reports, CP3 per milestone) |
| `changes/` | Scope change requests. Created when `/scope-change` is run. |
| `src/` | Application code |

## Current Phase

[Update as project progresses: Discovery / Design & Architecture / Build / Complete]

## Updating the Agency Framework

To pull the latest agent definitions and commands from the agency repo:

```bash
cd .agency && git pull origin main && cd ..
git add .agency
git commit -m "Update agency framework"
```
