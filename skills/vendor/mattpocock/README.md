# Vendored Skills — mattpocock/skills

These skills are vendored (copied) from [github.com/mattpocock/skills](https://github.com/mattpocock/skills),
licensed MIT © Matt Pocock. The full license text is in [`LICENSE`](./LICENSE).

They live in the repo (rather than being installed as a Claude Code plugin) so they travel with
the `.agency/` submodule into every consuming project, and so we can adapt them to this framework.

## Why vendored, not plugin-installed

The Matt Pocock installer places skills in `.claude/skills/` and `.agents/skills/`, which are
per-machine and — for a submodule — read from the *host* project, not from `.agency/`. Vendoring
into a committed path keeps them available everywhere the framework goes and lets us edit them.

## What we took (and skipped)

Vendored: `tdd`, `domain-modeling`, `codebase-design`, `design-an-interface`, `prototype`,
`improve-codebase-architecture`, `to-tickets`, `implement`, `research`, `grill-me`, `grilling`
(dependency), `grill-with-docs`, `handoff`, `request-refactor-plan`, `writing-great-skills`.

Skipped because the framework already owns that workflow: `diagnosing-bugs` (→ `skills/bug-investigation.md`,
`/investigate`), `code-review` (→ `/github-review`), `qa` (→ QA Engineer + `/log-bug`), `triage`,
`to-spec` (→ `/refine`), `setup-matt-pocock-skills` (we wire skills by hand), `claude-handoff`
(duplicate of `handoff`), `teach`.

## Local modifications

- `to-tickets/SKILL.md` — removed the dependency on `/setup-matt-pocock-skills` and defaulted the
  publish target to **GitHub Issues** (matching `skills/github-workflow.md`), keeping local files
  as a fallback.

Keep this list current when you edit a vendored skill, so a future re-vendor doesn't silently
clobber a change.

## Updating from upstream

There is no auto-update (that's the tradeoff for vendoring). To refresh:

1. Re-download the `SKILL.md` + reference files for each skill from the upstream repo
   (paths under `skills/engineering/`, `skills/productivity/`, `skills/deprecated/`).
2. Re-apply the local modifications listed above.
3. Skip the Codex `agents/openai.yaml` files — this framework is Claude-based and doesn't use them.

Wiring lives in `skills/skill-check.md`, `CLAUDE.md`, `README.md`, and
`principles/spec-driven-development.md` (the TDD pointer).
