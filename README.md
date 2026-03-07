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
     │              Produces: Architecture (structural decisions), Tech Stack,
     │              Tradeoff Log, Risk Register, PRD, Epics + prioritised
     │              epic backlog, IA + key flows. Stories elaborated later.
     │
     ▼
╔═══════════════════════════════╗
║  CHECKPOINT 2: Build Approval  ║  ← Most critical. Wrong here = expensive.
║  Guided: you approve before proceeding     ║
║  Autonomous: Orchestrator logs + continues ║
╚═══════════════════════════════╝
     │
     ▼
[/build] ──────── Setup: Implementation Plan, CI/CD, Test Strategy,
     │             Analytics Plan — before any code is written.
     │             Each sprint: Backlog Refinement (PM + UX elaborate
     │             next sprint's epics into stories) → Sprint Planning
     │             → Execute (Dev → QA → Engineering Lead) → Sprint Review
     │             Repeat until milestone complete.
     │
     ▼
╔═══════════════════════════════╗
║  CHECKPOINT 3: Milestone Review (optional) ║
║  Reviews what was built, divergences,      ║
║  QA sign-off, and next milestone scope     ║
╚═══════════════════════════════╝
     │
     ▼
[/release] ───── Release checklist across code, infrastructure,
     │            monitoring, analytics, docs. Human approval required.
     │            Deploy → post-deploy monitoring → confirm healthy.
     ▼
  Working Software

[/retrospective] ── Review all phases. Propose and apply specific
                    improvements back to agent_directory. Agency
                    gets smarter with every project.
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
    personas/
      [persona-name].md     ← one file per persona
    user-journey.md
    assumption-map.md
```

After `/architecture`:
```
  design/
    checkpoint-2.md
    architecture.md
    tradeoff-log.md
    risk-register.md
    prd.md
    technical-research-report.md
    ux-flows.md               ← IA, key flows, screen inventory (not all detailed screens)
    epics/
      EP-001-[slug].md        ← one per epic, approved at CP2
    stories/                  ← empty at CP2; populated during backlog refinement
```

After `/build` (grows sprint by sprint):
```
  build/
    code-standards.md
    implementation-plan.md    ← milestones → sprints → tasks, with reviews
    infrastructure-plan.md
    analytics-plan.md
    test-strategy.md
    test-cases/
      [feature].md
    qa-reports/
      [sprint-or-task].md
    release-[version].md      ← after /release
  design/
    stories/
      US-001-[slug].md        ← elaborated during backlog refinement, one sprint ahead
    sprint-flows/
      sprint-[N].md           ← detailed screen specs per sprint
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

## Principles

Foundational beliefs that shape how all agents think and work — always in effect, not applied situationally.

| Principle | Summary |
|-----------|---------|
| `principles/spec-driven-development.md` | Spec is written first and is always the source of truth. Code never drives spec changes. The spec hierarchy: Problem Statement → PRD (epics) → Architecture → Story (just-in-time) → Task → Code. |
| `principles/agile.md` | Requirements are elaborated iteratively — structural architecture and epics at CP2, detailed stories just-in-time one sprint ahead via backlog refinement. Build runs in sprints within milestones. Backlog refinement, sprint planning, and sprint review are the core ceremonies. |

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

**Project-level**
| Template | Used For |
|----------|---------|
| `templates/project-brief.md` | Created by `/new-project` |
| `templates/project-CLAUDE.md` | Copy to project root as `CLAUDE.md` on setup |
| `templates/decisions.md` | Decision log format, created by `/new-project` |
| `templates/scope-change-request.md` | Created by `/scope-change` |
| `templates/release-checklist.md` | Created by `/release` |
| `templates/retrospective.md` | Created by `/retrospective` |

**Checkpoints**
| Template | Compiled By |
|----------|-------------|
| `templates/checkpoint-1.md` | Product Strategist + Orchestrator |
| `templates/checkpoint-2.md` | Systems Architect + PM + Orchestrator (epics + structural architecture) |
| `templates/checkpoint-3.md` | Engineering Lead + QA + Orchestrator |

**Discovery docs** (`discovery/`)
| Template | Created By |
|----------|------------|
| `templates/docs/persona.md` | User Researcher — one file per persona |
| `templates/docs/user-journey.md` | User Researcher |
| `templates/docs/market-analysis.md` | Market Analyst |
| `templates/docs/assumption-map.md` | Product Strategist + Systems Architect |

**Design & Architecture docs** (`design/`)
| Template | Created By | When |
|----------|------------|------|
| `templates/docs/prd.md` | Product Manager | CP2 — epic-level requirements |
| `templates/docs/epic.md` | Product Manager | CP2 — one per feature area |
| `templates/docs/user-story.md` | Product Manager | Backlog refinement — one sprint ahead |
| `templates/docs/ux-flows.md` | UX Designer | CP2 (IA + key flows); per sprint (detailed screens) |
| `templates/docs/architecture.md` | Systems Architect | CP2 — structural decisions |
| `templates/docs/tradeoff-log.md` | Systems Architect | CP2 + ongoing |
| `templates/docs/risk-register.md` | Systems Architect | CP2 + ongoing |
| `templates/docs/technical-research-report.md` | Technical Researcher | During architecture phase |

**Build docs** (`build/`)
| Template | Created By | When |
|----------|------------|------|
| `templates/docs/code-standards.md` | Engineering Lead | Before first commit |
| `templates/docs/implementation-plan.md` | Engineering Lead | Build start |
| `templates/docs/infrastructure-plan.md` | DevOps Engineer | Build start |
| `templates/docs/analytics-plan.md` | Analytics Engineer | Build start |
| `templates/docs/test-strategy.md` | QA Engineer | Before first commit |
| `templates/docs/test-cases.md` | QA Engineer | Per sprint |
| `templates/docs/qa-report.md` | QA Engineer | Per task / milestone |
