---
name: Wiki Operations
used-by:
  - Market Analyst
  - Technical Researcher
when: Ingesting research sources into the wiki; querying for prior knowledge before starting research
---

# Wiki Operations

**Used By:** Market Analyst, Technical Researcher, and any agent that consumes or produces research
**When:** Any time an agent ingests a source, queries for existing knowledge, or the wiki needs a health check

---

## The Model

The wiki is the project's **living knowledge base** — accumulated research and synthesis that persists across all phases. It is distinct from formal phase artifacts:

| Wiki (`wiki/`) | Formal artifacts (`discovery/`, `design/`, `build/`) |
|----------------|------------------------------------------------------|
| Living, updated as knowledge grows | Point-in-time, approved at checkpoints |
| Research, synthesis, evolving understanding | Specs, plans, decided outputs |
| Written by agents during research | Generated from wiki knowledge for human review |

**Rule:** If you're learning something, write it to the wiki. If you're deciding something, write it to a formal doc — ideally drawing from wiki knowledge already there.

---

## Directory Structure

```
wiki/
  raw/        ← immutable source documents (articles, reports, transcripts, data files)
  inbox/      ← unprocessed sources dropped in by the human; process these before raw/
  pages/      ← LLM-maintained wiki pages (all agent-generated content lives here)
  index.md    ← content catalogue; read this first on any query
  log.md      ← append-only operation record
  CLAUDE.md   ← wiki schema: page categories, format conventions, domain-specific rules
```

Never modify files in `raw/`. Never delete from `log.md`. The wiki schema at `wiki/CLAUDE.md` is the authoritative config for this specific wiki — read it before operating.

---

## Ingest Protocol

When processing a source (from `inbox/` or `raw/`):

1. **Move from inbox if needed.** If the source is in `inbox/`, move it to `raw/` first.
2. **Read the source fully.** Identify: what is this, what are the key claims, what entities and concepts does it introduce.
3. **Check `wiki/index.md`** for pages that this source is relevant to.
4. **Update existing pages.** For each relevant page:
   - Integrate new information
   - Note if new data contradicts or supersedes existing claims (mark with `> **Updated [date]:**`)
   - Add the source to the page's `Sources` section
5. **Create new pages** for any entities or concepts that warrant their own page and don't have one yet. See page format below.
6. **Update `wiki/index.md`:** add entries for new pages; update the overview paragraph if the overall picture has shifted.
7. **Append to `wiki/log.md`:** one entry per ingest, format: `## [YYYY-MM-DD] ingest | [Source title]`

A single rich source can touch 5–15 pages. That is expected and correct.

---

## Query Protocol

When answering a question that requires wiki knowledge:

1. Read `wiki/index.md` to identify relevant pages.
2. Read those pages in full.
3. Synthesize an answer with inline citations (`[page title](pages/...)`) .
4. If the answer is substantive enough to be reusable — a comparison, an analysis, a key conclusion — save it as a new wiki page and add it to the index. Good answers compound.

---

## Page Format

```markdown
---
title: [Page title]
category: [category slug matching wiki/CLAUDE.md]
sources: [list of raw/ files that contributed to this page]
updated: [YYYY-MM-DD]
---

# [Page title]

[Body — clear, factual prose. Cross-reference related pages with [[Page Title]] or markdown links.]

## Key Points
- [Bullet summary of the most important facts on this page]

## Cross-References
- [Related page](pages/...) — why it's related

## Sources
- `raw/[filename]` — [one-line description of what this source contributed]
```

Keep pages focused — one entity or concept per page. Prefer updating an existing page over creating a new one unless the topic genuinely warrants its own page.

---

## Index Format

`wiki/index.md` is a catalogue, not a summary. Structure:

```markdown
# Wiki Index

_[N] pages · [N] sources · Last updated [date]_

## Overview
[1–2 sentences synthesizing the current state of knowledge across the whole wiki.]

## Pages by Category

### [Category]
- [Title](pages/...) — one-line hook
```

Update the page count and date on every ingest.

---

## Log Format

`wiki/log.md` is append-only. Each entry starts with a parseable prefix:

```
## [YYYY-MM-DD] ingest | Title of source
## [YYYY-MM-DD] query | Topic queried
## [YYYY-MM-DD] lint | Summary of findings
```

---

## Lint Checklist

When performing a wiki health check, look for:

- **Orphan pages** — pages with no inbound links from other pages or the index
- **Contradictions** — claims on one page that conflict with claims on another
- **Stale claims** — facts that newer sources have superseded (check source dates)
- **Missing pages** — concepts mentioned repeatedly across pages but lacking their own page
- **Dead cross-references** — links that point to pages that don't exist
- **Index gaps** — pages that exist but aren't listed in `index.md`
- **Knowledge gaps** — topics where the wiki is thin; suggest specific sources to find

Report findings in priority order: contradictions first (active misinformation risk), then gaps, then cosmetic issues.
