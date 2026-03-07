# Agent Directory

A complete AI-powered software development organization. This repo defines a team of specialized agents that takes product ideas from ideation through to working software — covering discovery, design, architecture, and build.

## How It Works

This repo is used as a **Git submodule** inside each project repository. The agent definitions, skills, templates, and commands live here and stay up to date. Project-specific content (brief, decisions, discovery docs, design docs, code) lives in the project repo.

```
your-project-repo/
  .agency/              ← this repo, as a submodule
  .claude/
    commands/           ← symlinked to .agency/.claude/commands/
  project-brief.md
  decisions.md
  discovery/
  design/
  build/
  src/
  CLAUDE.md
```

---

## The Team

```
Orchestrator (Engineering Manager)
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

Full definitions for each agent are in `agents/`. Each defines: Role, Inputs, Outputs, Responsibilities, Always Asks, and Escalates When.

---

## Workflow

```
 Human (you)
     │
     ▼
[/new-project] ─── Orchestrator creates structured project brief
     │
     ▼
[/discovery] ──── Product Strategist briefs Market Analyst + User Researcher
     │             Synthesizes research into Problem Statement, Solution Direction,
     │             Success Metrics, Scope Boundary, Assumption Map
     │
     ▼
╔═══════════════════════════════╗
║  CHECKPOINT 1: Problem-Solution Fit        ║
║  Guided: you approve before proceeding     ║
║  Autonomous: Orchestrator logs + continues ║
╚═══════════════════════════════╝
     │
     ▼
[/architecture] ── Systems Architect coordinates Technical Researcher,
     │              UX Designer, and Product Manager in parallel.
     │              Produces: Architecture Doc, Tech Stack, Tradeoff Log,
     │              Risk Register, PRD, User Stories, Prioritized Backlog
     │
     ▼
╔═══════════════════════════════╗
║  CHECKPOINT 2: Build Approval  ║  ← Most critical. Wrong here = expensive.
║  Guided: you approve before proceeding     ║
║  Autonomous: Orchestrator logs + continues ║
╚═══════════════════════════════╝
     │
     ▼
[/build] ──────── Engineering Lead produces Implementation Plan + Code Standards.
     │             QA Engineer defines Test Strategy before code is written.
     │             Developers execute tasks. QA validates each task.
     │             Engineering Lead reviews and integrates.
     │
     ▼
╔═══════════════════════════════╗
║  CHECKPOINT 3: Milestone Review (optional) ║
║  Reviews what was built, divergences,      ║
║  QA sign-off, and next milestone scope     ║
╚═══════════════════════════════╝
     │
     ▼
  Working Software
```

### Checkpoint Philosophy

Checkpoints are placed at **irreversible decision points** — where going forward locks you into something expensive to undo.

| Checkpoint | Gate | Notes |
|------------|------|-------|
| **CP1 — Problem-Solution Fit** | Discovery → Design & Architecture | Cheapest point to pivot |
| **CP2 — Build Approval** | Design & Architecture → Build | Most critical. Changes after this are expensive. |
| **CP3 — Milestone Review** | Per milestone during Build | Optional. Enable per project. |

### Modes

| Mode | Behavior |
|------|----------|
| **Guided** | You approve each checkpoint before the next phase begins |
| **Autonomous** | Agents run end-to-end. Checkpoints are logged but not blocking. |

In either mode, agents **always escalate** genuine blockers — a fork in the road where neither path is clearly better, or where a decision requires your values or priorities.

---

## Commands

| Command | What it does |
|---------|-------------|
| `/resume` | Reload project context at the start of any new session — always run this first |
| `/new-project` | Initialize a new project — collects brief, sets mode, creates tracking files |
| `/discovery` | Run the Discovery Team |
| `/architecture` | Run the Design & Architecture Team (requires CP1 approval) |
| `/build` | Run the Build Team (requires CP2 approval) |
| `/checkpoint` | Review and action a checkpoint |
| `/scope-change` | Handle a proposed scope change — assesses tier and manages re-work path |
| `/release` | Run the release checklist and deploy to production |
| `/retrospective` | Review the project and apply learnings back to the agency framework |
| `/status` | Show current project phase and checkpoint statuses |

---

## Setting Up a New Project

### Prerequisites
- This repo (`agent_directory`) accessible on GitHub
- A new GitHub repo created for your project

### Steps

```bash
# 1. Clone your new project repo
git clone https://github.com/[you]/[project-name]
cd [project-name]

# 2. Add agent_directory as a submodule
git submodule add https://github.com/[you]/agent_directory .agency

# 3. Run the setup script to symlink commands
bash .agency/setup.sh

# 4. Copy the project CLAUDE.md template
cp .agency/templates/project-CLAUDE.md CLAUDE.md

# 5. Commit the setup
git add .
git commit -m "Initialize agency framework"

# 6. Open Claude Code and run /new-project
```

### What You Get After Setup

```
[project-repo]/
  .agency/              ← agent_directory submodule (pinned to a commit)
  .claude/
    commands/           ← symlinked to .agency/.claude/commands/
  CLAUDE.md             ← copied from .agency/templates/project-CLAUDE.md, fill in
  .gitmodules           ← created by git submodule add
```

After running `/new-project`:
```
  project-brief.md      ← source of truth for all agents
  decisions.md          ← append-only decision log
```

After `/discovery`:
```
  discovery/
    checkpoint-1.md
    market-analysis.md
    user-personas.md
    user-journey.md
    assumption-map.md
```

After `/architecture`:
```
  design/
    checkpoint-2.md
    architecture.md
    prd.md
    backlog.md
    tradeoff-log.md
    risk-register.md
    ux-flows.md
```

After `/build`:
```
  build/
    code-standards.md
    implementation-plan.md
    qa-reports/
  src/
    ...
```

---

## Updating the Agency Framework

Each project pins to a specific commit of this repo — updates are deliberate, not automatic. To pull the latest agent definitions, skills, and commands into a project:

```bash
cd .agency
git pull origin main
cd ..
git add .agency
git commit -m "Update agency framework to latest"
```

---

## Improving the Agency

If you develop a better agent definition, skill, or command while working on a project, contribute it back:

```bash
cd .agency
# make your changes
git add .
git commit -m "Improve [agent/skill/command]: [what changed and why]"
git push origin main
cd ..
git add .agency
git commit -m "Update agency to include [improvement]"
```

---

## Shared Skills

Cross-cutting methodologies used by multiple agents.

| Skill | Used By | When |
|-------|---------|------|
| `skills/assumption-mapping.md` | Product Strategist, Systems Architect | Before finalizing any direction or architecture |
| `skills/options-framing.md` | Orchestrator, Systems Architect, Engineering Lead | When escalating a fork-in-the-road decision |
| `skills/scope-pressure-test.md` | Product Manager, Engineering Lead | To validate MVP scope and implementation plan |
| `skills/security-review.md` | QA Engineer, Engineering Lead | Any task touching auth, data handling, or external input |

---

## Templates

| Template | Used For |
|----------|---------|
| `templates/project-brief.md` | Created by `/new-project` |
| `templates/checkpoint-1.md` | Compiled by Product Strategist + Orchestrator |
| `templates/checkpoint-2.md` | Compiled by Systems Architect + PM + Orchestrator |
| `templates/checkpoint-3.md` | Compiled by Engineering Lead + QA + Orchestrator |
| `templates/project-CLAUDE.md` | Copy to project root as `CLAUDE.md` on setup |
