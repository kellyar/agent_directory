# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

This is the **Agent Directory** — a generic, reusable AI software development organization. It is used as a Git submodule (at `.agency/`) inside individual project repositories. This repo contains agent definitions, shared skills, templates, and commands. Project-specific content lives in each project's own repo.

Do not store project briefs, decisions, or artifacts here. Those belong in the project repo.

## Commands

| Command | What it does |
|---------|-------------|
| `/resume` | Reload project context at the start of any new session — always run this first |
| `/new-project` | Initialize a new project |
| `/discovery` | Run the Discovery Team |
| `/architecture` | Run the Design & Architecture Team (requires CP1 approval) |
| `/build` | Run the Build Team (requires CP2 approval) |
| `/checkpoint` | Review and action a checkpoint |
| `/scope-change` | Handle a proposed scope change mid-project |
| `/release` | Run the release checklist and deploy to production |
| `/retrospective` | Review the project and apply learnings back to the agency |
| `/status` | Show current project phase and checkpoint statuses |

## Agent Team Structure

```
Orchestrator
├── Discovery Team
│   ├── Product Strategist (Lead)
│   ├── Market Analyst
│   └── User Researcher
├── Design & Architecture Team
│   ├── Systems Architect (Lead)
│   ├── Product Manager
│   ├── UX Designer
│   └── Technical Researcher
└── Build Team
    ├── Engineering Lead (Lead)
    ├── Developer(s)
    ├── QA Engineer
    ├── DevOps Engineer
    └── Analytics Engineer
```

Agent definitions are in `agents/`. Each file defines: Role, Inputs, Outputs, Responsibilities, Always Asks, and Escalates When.

## Checkpoints

| Checkpoint | Gate | Critical? |
|------------|------|-----------|
| **CP1 — Problem-Solution Fit** | Discovery → Design & Architecture | No |
| **CP2 — Build Approval** | Design & Architecture → Build | **Yes** |
| **CP3 — Milestone Review** | Per milestone during Build | Optional |

In **Guided mode**, the human approves each checkpoint before the next phase begins.
In **Autonomous mode**, the Orchestrator logs decisions and proceeds.

## Shared Skills

| Skill | Used By | When |
|-------|---------|------|
| `skills/assumption-mapping.md` | Product Strategist, Systems Architect | Before finalizing any direction |
| `skills/options-framing.md` | Orchestrator, Systems Architect, Engineering Lead | When escalating a fork-in-the-road |
| `skills/scope-pressure-test.md` | Product Manager, Engineering Lead | To validate MVP scope and build plan |
| `skills/security-review.md` | QA Engineer, Engineering Lead | Any task touching auth, data handling, or external input |

## Submodule Usage

This repo is designed to be added to project repos as:
```bash
git submodule add https://github.com/[you]/agent_directory .agency
bash .agency/setup.sh
```

See `README.md` for full setup instructions and the complete workflow.
