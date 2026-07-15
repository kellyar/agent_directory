# Skill Check

Before acting on any task, check whether a skill applies. This is a habit, not an optional step.

## The Rule

Before responding to any task or instruction, ask: **"Does any skill apply here?"**

The threshold is low. If there is even a small chance a skill applies — invoke it. Do not assume you already know how to perform a skill-shaped task without consulting the skill. A skill is the agreed-upon process for that class of work, not a suggestion.

## Skill Trigger Conditions

| Skill | Invoke when... |
|-------|---------------|
| `skills/assumption-mapping.md` | Starting a new direction, committing to a technical approach, or identifying risks |
| `skills/options-framing.md` | Two or more valid paths exist and the human needs to choose |
| `skills/scope-pressure-test.md` | Finalising MVP scope, sizing a backlog, or reviewing a build plan |
| `skills/security-review.md` | Any feature touching auth, data handling, payments, or external input |
| `skills/github-workflow.md` | Any branching, PR creation, code review, or merge activity |
| `skills/bug-investigation.md` | A bug has been reported and root cause is unknown |

## Vendored Craft Skills (`skills/vendor/mattpocock/`)

Engineering and craft techniques vendored from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT). These are the *how* of good implementation — invoke them alongside the process skills above.

| Skill | Invoke when... | Primary role |
|-------|---------------|--------------|
| `skills/vendor/mattpocock/grill-me` | Stress-testing a plan or design with the human before committing to it | Product Strategist, Systems Architect |
| `skills/vendor/mattpocock/grill-with-docs` | Same interrogation, but you also want ADRs + a glossary produced as you go | Systems Architect, Product Manager |
| `skills/vendor/mattpocock/domain-modeling` | Pinning down ubiquitous language or recording an architectural decision (ADR) | Systems Architect |
| `skills/vendor/mattpocock/codebase-design` | Designing or improving a module's interface — deciding where a seam goes, making code testable/navigable | Engineering Lead, Systems Architect |
| `skills/vendor/mattpocock/design-an-interface` | Exploring several radically different API shapes for a module ("design it twice") | Systems Architect, Engineering Lead |
| `skills/vendor/mattpocock/prototype` | Building a throwaway prototype to answer a state-model or UI design question | Developer, Systems Architect |
| `skills/vendor/mattpocock/to-tickets` | Breaking an approved spec/epic into tracer-bullet tickets with blocking edges | Product Manager, Engineering Lead |
| `skills/vendor/mattpocock/implement` | Executing a story/ticket from its spec | Developer |
| `skills/vendor/mattpocock/tdd` | Writing feature code or fixing a bug test-first (red → green → refactor) | Developer, QA Engineer |
| `skills/vendor/mattpocock/improve-codebase-architecture` | Scanning an existing codebase for deepening opportunities | Engineering Lead |
| `skills/vendor/mattpocock/request-refactor-plan` | Planning a refactor as an RFC broken into tiny commits | Engineering Lead |
| `skills/vendor/mattpocock/research` | Investigating a question against primary sources and capturing findings in the repo | Technical Researcher, Market Analyst |
| `skills/vendor/mattpocock/handoff` | Compacting the current session into a handoff doc for another agent | Orchestrator |
| `skills/vendor/mattpocock/writing-great-skills` | Authoring or editing a skill in this framework | Orchestrator |

`grilling` is a shared dependency of `grill-me`, `grill-with-docs`, and `improve-codebase-architecture` — it is invoked by those skills, not directly.

## How to Apply

1. Read the task or instruction.
2. Scan the trigger conditions above.
3. If any skill matches — read and apply it before acting.
4. If uncertain — apply it anyway. False positives are cheap. Skipped skills cause process drift.

## Rationalisations to Reject

- "This is a simple case" — simple cases are where unexamined assumptions cause the most wasted work.
- "I already know how to do this" — the skill may have gates or nuances you'd otherwise skip.
- "The human didn't ask for it" — process discipline is your responsibility, not theirs.
