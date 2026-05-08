Run a health check on the project wiki.

Read `wiki/CLAUDE.md` to understand the schema and conventions for this wiki. If `wiki/CLAUDE.md` does not exist, stop and direct the user to run `/new-wiki` first.

---

## Step 1 — Build the page inventory

Read `wiki/index.md` to get the list of all pages. Then scan `wiki/pages/` to find any pages that exist on disk but are missing from the index. Note both the indexed pages and the filesystem pages — gaps between them are a finding.

---

## Step 2 — Run the lint checklist

Apply `.agency/skills/wiki-operations.md` lint checklist. Check for:

**Contradictions (highest priority)**
Read pages that cover related topics and check for conflicting claims. Note the specific pages and the specific claims that conflict.

**Stale claims**
Look for pages where the `updated` frontmatter date is significantly older than the most recently ingested sources. Flag claims that may have been superseded.

**Orphan pages**
Pages with no inbound links from other pages or from `index.md`. These are knowledge islands.

**Missing pages**
Scan all pages for concept names or entity names that appear repeatedly but have no dedicated page. These are candidates to create.

**Dead cross-references**
Check whether links in pages point to files that actually exist.

**Index gaps**
Pages on disk not listed in `index.md`.

**Knowledge gaps**
Based on the project domain and what's in the wiki, what topics are thin or missing entirely? What specific types of sources would fill them?

---

## Step 3 — Report findings

Present a prioritized report:

```
## Wiki Health Report — [date]

**Pages:** [N] indexed · [N] on disk
**Sources:** [N] in raw/  ·  [N] pending in inbox/

### Contradictions
[list — page A vs page B, specific claim]

### Stale Claims
[list]

### Orphans
[list]

### Missing Pages (candidates to create)
[list]

### Knowledge Gaps
[list of topics + suggested source types to find]
```

If the wiki is healthy, say so clearly.

---

## Step 4 — Offer to fix

For any issues found, ask the user which ones to fix now. Orphan pages, dead links, and index gaps can be fixed immediately. Missing pages can be created as stubs. Contradictions require judgment — flag them and ask the user to decide which claim is correct before updating.

Append to `wiki/log.md`:

```
## [date] lint | [N] issues found: [brief summary]
```
