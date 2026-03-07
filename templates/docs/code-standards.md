# Code Standards

**Created by:** Engineering Lead
**Project:** [Project Name]
**Version:** 1.0
**Date:** [YYYY-MM-DD]

These standards apply to all code written for this project. Defined before the first line of code is written. Deviations require Engineering Lead approval and must be logged with rationale.

---

## Language & Runtime

| Tool | Version | Notes |
|------|---------|-------|
| | | |

## Project Structure
[Directory layout and the purpose of each top-level folder. Clear enough that a new Developer knows where everything goes without asking.]

```
[root]/
  src/
    [describe what lives here]
  tests/
  docs/
```

---

## Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Files | | |
| Directories | | |
| Variables | | |
| Functions / methods | | |
| Classes | | |
| Constants | | |
| Database tables | | |
| Database columns | | |
| API endpoints | | |

---

## Code Style

- **Formatter:** [tool + config file location]
- **Linter:** [tool + config file location]
- **Max line length:** [characters]
- **Imports:** [ordering convention]

**Key rules:**
- [Rule — e.g., No magic numbers: extract to named constants]
- [Rule — e.g., Functions do one thing and are named for what they do]
- [Rule — e.g., No commented-out code in committed files]

---

## Architecture Patterns
Patterns in use on this project and when to apply them.

### [Pattern name — e.g., Repository Pattern]
**When to use:** [Specific condition]
**Reference example:** [Point to a file once the first example exists]

---

## Error Handling

[How errors are handled, surfaced, and logged across the project. Be specific — vague guidance leads to inconsistent implementations.]

- **Validation errors:** [how surfaced to user / caller]
- **External API failures:** [retry strategy, fallback, user message]
- **Unexpected errors:** [logging approach, what gets exposed vs. swallowed]
- **Logging:** [tool, log levels, what gets logged at each level]

---

## Dependencies

- **Adding a dependency requires:** [approval process, e.g., "Engineering Lead review before adding"]
- **Prefer:** [criteria for acceptable dependencies — e.g., maintained in last 6 months, MIT/Apache license]
- **Banned or restricted:** [any specific packages or patterns to avoid]

---

## Testing

- **Unit tests:** [required for — e.g., all business logic, utility functions]
- **Integration tests:** [required for — e.g., all API endpoints, database interactions]
- **File naming:** [convention — e.g., `[file].test.ts` alongside source]
- **Test data:** [how test data is managed — fixtures, factories, etc.]
- **Coverage target:** [if any — be honest if there isn't one]

---

## Git Workflow

*This project follows the branching and PR process defined in `.agency/skills/github-workflow.md`. Fill in project-specific settings below.*

- **Branch naming:** `feature/US-[XXX]-[slug]` for stories · `fix/[slug]` for bugs · `infra/[slug]` for DevOps work
- **Commit message format:** `[US-XXX] Short description in imperative mood`
- **PR requirements:** CI passing · QA sign-off commented on PR · Engineering Lead approval · human merge
- **Merge gate:** Human approval required before merging to `main` — always, regardless of project mode
- **Additional CI checks:** [any project-specific checks — e.g., type checking, security scanning, coverage threshold]
- **Branch lifecycle:** Delete branches after merge — yes / no
- **Special rules:** [any project-specific additions]

---

## Definition of Done

A task is not complete until:
- [ ] Code meets all standards in this document
- [ ] All acceptance criteria from the user story pass
- [ ] Tests written and passing locally
- [ ] No new linter warnings introduced
- [ ] QA sign-off received on acceptance criteria and commented on the PR
- [ ] Engineering Lead code review complete and PR approved
- [ ] PR marked Ready for Review and awaiting human merge
- [ ] [Any project-specific criteria]
