# Wiki Schema — [Project Name]

This file is the authoritative configuration for this wiki. Read it before any wiki operation.

## Purpose

This wiki is the living knowledge base for **[Project Name]**. It accumulates research and synthesis across all project phases so knowledge compounds rather than gets rediscovered.

**What belongs here:** market research, competitor intelligence, technical findings, user insights, domain concepts, key analyses.

**What does not belong here:** formal specs, PRDs, architecture docs, sprint plans, approved checkpoint outputs — those live in `discovery/`, `design/`, and `build/`. The wiki feeds those documents; it is not a duplicate of them.

---

## Page Categories

| Category | Path | Contains |
|----------|------|----------|
| Competitors | `pages/competitors/` | One page per competitor — product, positioning, strengths, weaknesses |
| Market | `pages/market/` | Trends, timing factors, market context, analogous examples |
| Technical | `pages/technical/` | Technology options, library evaluations, patterns, known pitfalls |
| Users | `pages/users/` | User segments, behaviours, observed pain points beyond formal personas |
| Concepts | `pages/concepts/` | Domain concepts: definitions, how they work, why they matter |
| Synthesis | `pages/synthesis/` | Analyses, comparisons, key conclusions that cut across categories |

Add, remove, or rename categories here as the project domain demands. The categories above are defaults for a software project.

---

## Page Format

Every page must include YAML frontmatter:

```yaml
---
title: [Page title]
category: [one of: competitors, market, technical, users, concepts, synthesis]
sources: [list of raw/ files that contributed]
updated: [YYYY-MM-DD]
---
```

Body structure: prose first, then `## Key Points` (bullets), then `## Cross-References`, then `## Sources`.

---

## Ingest Rules

1. Move source from `inbox/` to `raw/` before processing.
2. Check `index.md` for relevant existing pages before creating new ones.
3. Update existing pages before creating new ones — prefer depth over breadth.
4. A single source can and should update multiple pages.
5. Always update `index.md` and append to `log.md` after every ingest.

---

## Cross-Referencing Convention

Use relative markdown links: `[Page Title](../category/page-title.md)`. Every new page should link to at least one other page. Isolated pages are a smell.

---

## Source Handling

- `raw/` is immutable — never edit files here.
- `inbox/` is a staging area — process everything in it before starting other work.
- When in doubt about whether to ingest a source, ingest it. Inclusion bias is better than gaps.
