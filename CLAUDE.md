# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

This is the **Agent Directory** — a generic, reusable AI software development organization. It is used as a Git submodule (at `.agency/`) inside individual project repositories. This repo contains agent definitions, shared skills, templates, and commands. Project-specific content lives in each project's own repo.

Do not store project briefs, decisions, or artifacts here. Those belong in the project repo.

## Commands

| Command | What it does |
|---------|-------------|
| `/resume` | Reload project context at the start of any new session — always run this first |
| `/context` | Save the current session state to `context.md` — run this before closing |
| `/new-project` | Initialize a new project |
| `/new-wiki` | Set up the wiki knowledge base (run automatically by `/new-project`) |
| `/wiki-lint` | Health-check the wiki: orphans, contradictions, knowledge gaps |
| `/discovery` | Run the Discovery Team |
| `/architecture` | Run the Design & Architecture Team (requires CP1 approval) |
| `/build` | Run the Build Team (requires CP2 approval) |
| `/epic` | Run a single epic: elaborate stories, get approval, build, review |
| `/refine` | Elaborate and review stories for the next epic before starting it |
| `/checkpoint` | Review and action a checkpoint |
| `/investigate` | Investigate a bug: reproduce, trace root cause, produce a Bug Report |
| `/github-branch` | Start a story: create the feature branch and open a Draft PR |
| `/github-review` | Engineering Lead reviews an open PR and posts the review via `gh` |
| `/github-status` | Show all open PRs, CI status, and what's blocking |
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

## Principles

Foundational beliefs that shape how all agents think and work. Not methodologies to apply situationally — always in effect.

| Principle | Applies To | Summary |
|-----------|-----------|---------|
| `principles/spec-driven-development.md` | All agents | Spec is written first and is the source of truth. Code never drives spec changes. Use `[NEEDS CLARIFICATION]` to flag uncertainty explicitly — it's a gate, not a note. Tests are written before code and confirmed failing. The spec hierarchy runs Problem Statement → PRD (epics) → Architecture → Story (just-in-time) → Task → Code. Production reality feeds back into updated specs via the retrospective. |
| `principles/agile.md` | Build Team | Requirements are elaborated iteratively — architecture and epics upfront at CP2, detailed stories just-in-time before each epic starts. Build runs epic by epic within milestones. |

## Shared Skills

| Skill | Used By | When |
|-------|---------|------|
| `skills/skill-check.md` | All agents | Before every action — scan for applicable skills and invoke before proceeding. If there's even a small chance a skill applies, read it first. |
| `skills/user-interview.md` | Product Strategist, User Researcher | Before producing any discovery artifacts; when user feedback is needed during or after build |
| `skills/bug-investigation.md` | QA Engineer, Engineering Lead | When a bug is reported and root cause is unknown |
| `skills/assumption-mapping.md` | Product Strategist, Systems Architect | Before finalizing any direction |
| `skills/options-framing.md` | Orchestrator, Systems Architect, Engineering Lead | When escalating a fork-in-the-road |
| `skills/scope-pressure-test.md` | Product Manager, Engineering Lead | To validate MVP scope and build plan |
| `skills/security-review.md` | QA Engineer, Engineering Lead | Any task touching auth, data handling, or external input |
| `skills/github-workflow.md` | Developer, Engineering Lead, QA Engineer, DevOps Engineer | All build phase work — branching, PRs, and merge gate |
| `skills/wiki-operations.md` | Market Analyst, Technical Researcher | Ingesting research into the wiki; querying for prior knowledge |

## Vendored Craft Skills

Engineering and craft techniques vendored from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT), under `skills/vendor/mattpocock/`. Each is a native-format skill (`SKILL.md` + reference files). They are the *how* of implementation; the process skills above are the *when/why*. See the trigger table in `skills/skill-check.md` for full role mappings.

| Skill | Used By | When |
|-------|---------|------|
| `vendor/mattpocock/grill-me`, `grill-with-docs` | Product Strategist, Systems Architect, PM | Stress-testing a plan/design before committing (grill-with-docs also emits ADRs + glossary) |
| `vendor/mattpocock/domain-modeling` | Systems Architect | Pinning down ubiquitous language; recording ADRs |
| `vendor/mattpocock/codebase-design`, `design-an-interface` | Engineering Lead, Systems Architect | Designing/improving a module's interface; exploring API shapes |
| `vendor/mattpocock/prototype` | Developer, Systems Architect | Throwaway prototype to answer a design question |
| `vendor/mattpocock/to-tickets` | Product Manager, Engineering Lead | Breaking an approved spec/epic into tracer-bullet tickets |
| `vendor/mattpocock/implement`, `tdd` | Developer, QA Engineer | Executing a ticket from spec; building/fixing test-first |
| `vendor/mattpocock/improve-codebase-architecture`, `request-refactor-plan` | Engineering Lead | Finding deepening opportunities; planning a refactor |
| `vendor/mattpocock/research` | Technical Researcher, Market Analyst | Investigating a question against primary sources |
| `vendor/mattpocock/handoff` | Orchestrator | Compacting a session into a handoff doc |
| `vendor/mattpocock/writing-great-skills` | Orchestrator | Authoring or editing a skill in this framework |

## Submodule Usage

This repo is designed to be added to project repos as:
```bash
git submodule add https://github.com/[you]/agent_directory .agency
bash .agency/setup.sh
```

See `README.md` for full setup instructions and the complete workflow.
