Run a competitive review of the current product against the market landscape.

Act as the Market Analyst (defined in `.agency/agents/discovery/market-analyst.md`), coordinated by the Product Strategist (`.agency/agents/discovery/product-strategist.md`).

This command can be run at any time — it does not require a project phase. It is designed to be run periodically on a live product to surface market movement, competitor changes, and feature gaps that should inform future work.

Read `project-brief.md` and `design/prd.md` to establish the current product's scope, personas, and stated differentiators. Read `context.md` for current project state.

---

## Step 1 — Define the research brief

As Product Strategist, define the questions the Market Analyst must answer:

1. Who are the direct competitors (same problem, same audience)?
2. Who are the indirect competitors (different approach, same audience)?
3. What features or capabilities are competitors shipping that this product does not have?
4. What are the dominant industry trends in this product category right now?
5. Where are competitors weakest — what do users complain about most?
6. Are there any new entrants, acquisitions, or pivots that change the landscape?
7. What jobs-to-be-done are underserved across the whole category?

---

## Step 2 — Research

As Market Analyst, use web search to answer each question. For each competitor found:
- Note the product name, positioning, and target audience
- List their key features relevant to this product's space
- Note pricing model if available
- Note any user sentiment signals (app store reviews, Reddit, community forums)
- Note any recent notable changes (new features, pricing changes, pivots)

Research industry trends:
- What are analysts, journalists, or practitioners writing about in this category?
- Are there regulatory, demographic, or behavioural shifts relevant to this product?
- Are there technology shifts (AI, open banking, etc.) being adopted by competitors?

Do not editorialize during research. Record what is actually true.

---

## Step 3 — Gap analysis

As Product Strategist, compare the research findings against the current product:

For each gap or opportunity found, classify it:
- **Feature gap** — a specific capability competitors have that this product lacks
- **UX gap** — something competitors do better in terms of experience or workflow
- **Trend opportunity** — an industry shift this product could capitalise on
- **Competitive threat** — a competitor move that could erode this product's position
- **Underserved need** — a job-to-be-done the whole category is missing

For each item, note:
- Effort estimate: Small / Medium / Large
- Strategic value: Low / Medium / High
- Who it serves (which persona)

---

## Step 4 — Produce the review document

Create `discovery/competitive-review-[YYYY-MM-DD].md` using `.agency/templates/competitive-review.md`. Fill in all sections with honest, specific findings — not generalities.

---

## Step 5 — Update the opportunity backlog

Read `backlog/opportunities.md` if it exists. If not, create it.

For each gap or opportunity identified in Step 3, add an entry to `backlog/opportunities.md` if it is not already present (check by title). Do not duplicate existing entries — update them if new information materially changes the picture.

Format each entry using the structure in `.agency/templates/competitive-review.md` (Opportunity Backlog Entry section).

Mark entries that were previously in the backlog but are now invalidated or resolved as `status: closed` with a note.

---

## Step 6 — Present findings

Present a summary to the user:
- How many competitors researched
- Top 3 most actionable opportunities (High value, evidence-backed)
- Any immediate threats that warrant attention
- Link to the full review doc and updated backlog

Ask if any findings should be escalated to a `/scope-change` immediately, or whether they stay in the opportunity backlog for future planning.
