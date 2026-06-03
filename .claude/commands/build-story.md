Build a Ready story end-to-end: write QA test cases, implement the code, open a PR, and request Engineering Lead review.

**Usage:** `/build-story <story-id>` (e.g. `/build-story US-008`)

If no argument is provided, find the most recently merged `plan/*` branch and build its story.

Act as the Engineering Lead (`.agency/agents/build/engineering-lead.md`), delegating implementation to the Developer (`.agency/agents/build/developer.md`) and test case writing to the QA Engineer (`.agency/agents/build/qa-engineer.md`).

Read before starting: `design/stories/{US-NNN}-*.md`, `design/architecture.md`, `build/code-standards.md`, `build/implementation-plan.md`.

Apply throughout: `.agency/principles/spec-driven-development.md`

---

## Step 1 — Load the story

```bash
ls design/stories/
```

Find `design/stories/{US-NNN}-*.md`. Read it fully.

**Stop if any of these are true:**
- Story status is not `Ready` — direct the user to `/plan-issue` or resolve `[NEEDS CLARIFICATION]` markers first
- Story has unresolved `[NEEDS CLARIFICATION]` markers
- A feature branch for this story already exists (`git branch -a | grep {US-NNN}`)

Report which story is being built and confirm all dependencies listed in the story spec are marked Done.

## Step 2 — Write QA test cases

**As QA Engineer** — create `build/test-cases/{US-NNN}-{slug}.md` before any code is written.

Per `principles/spec-driven-development.md`: tests are written against acceptance criteria, confirmed failing (because nothing is built yet), then handed to the Developer.

For each acceptance criterion in the story:
- Write one or more specific test cases: input → action → expected output
- Note the test type: unit test (pure function), component test, or manual test
- For unit/component tests: specify the file where the test lives (e.g. `src/lib/myModule.test.js`)
- For manual tests: write a step-by-step procedure a human can follow to verify pass/fail
- Mark each test case: `[ ] Not yet implemented`

**Format:**

```markdown
## TC-{N}: {AC reference} — {short description}
**Type:** unit | component | manual
**File:** `path/to/test/file.test.js` (unit/component only)
**Setup:** [any preconditions]
**Steps:**
1. ...
**Expected:** [specific, observable outcome]
**Status:** [ ] Not yet implemented
```

Minimum one test case per acceptance criterion. Risk-based: the highest-risk areas per `build/implementation-plan.md` get the most coverage.

## Step 3 — Create the feature branch and draft PR

```bash
git checkout main && git pull origin main
git checkout -b feature/{US-NNN}-{slug}
git push -u origin feature/{US-NNN}-{slug}
```

Where `{slug}` is a short, lowercase, hyphenated version of the story title (max 5 words).

```bash
gh pr create \
  --base main \
  --draft \
  --title "[{US-NNN}] {story title}" \
  --body "..."
```

**PR body must include:**
- `Closes` or `Related to` the originating issue number (from story spec)
- Link to story spec: `design/stories/{US-NNN}-{slug}.md`
- Each acceptance criterion as an unchecked checkbox
- QA sign-off section: `Pending — see build/test-cases/{US-NNN}-{slug}.md`
- Branch: `feature/{US-NNN}-{slug}`

## Step 4 — Implement

**As Developer** — implement exactly what the story spec says. No more, no less.

For each acceptance criterion, in order:
1. Write the code change
2. Run the relevant unit/component test — confirm it passes
3. Check the criterion off in your working notes

**Implementation rules:** Follow `build/code-standards.md` exactly. When in doubt, check the standards doc — do not improvise conventions.

**If you hit a spec gap:** stop and surface it — do not fill it in yourself. The spec is the source of truth. Post a comment on the PR with the specific ambiguity and wait for resolution.

After all criteria are implemented:

```bash
npm run lint
npm test
```

Both must pass with no new warnings before proceeding.

## Step 5 — Commit test cases and implementation

```bash
git add build/test-cases/{US-NNN}-{slug}.md
git add [all implementation files]
git commit -m "[{US-NNN}] {imperative description of what was built}"
git push
```

Commit message format: `[EP-00X][US-0NN] Imperative description` — under 72 characters.

## Step 6 — QA sign-off

**As QA Engineer** — run through every manual test case in `build/test-cases/{US-NNN}-{slug}.md`. For each:
- Execute the steps
- Record the actual outcome
- Mark `[x] Pass` or `[ ] Fail — {reason}`

If any test fails: fix the implementation, re-run, and re-check before proceeding. Do not mark the PR ready with failing tests.

Update each test case status in the file. Commit the updated test cases.

Post a QA sign-off comment on the PR:
```bash
gh pr comment --body "**QA sign-off**

All test cases in \`build/test-cases/{US-NNN}-{slug}.md\` pass.

| Criterion | Test | Result |
|-----------|------|--------|
| AC-1 | TC-1 | ✅ Pass |
...

Ready for Engineering Lead review."
```

## Step 7 — Mark PR ready and request review

```bash
gh pr ready
gh pr edit --add-reviewer [Engineering Lead / human reviewer if known]
```

Update story status in `design/stories/{US-NNN}-{slug}.md`:

```
**Status:** In Progress → Done (pending merge)
```

---

## Output

Report:
- Story {US-NNN} loaded — status confirmed Ready
- QA test cases written: `build/test-cases/{US-NNN}-{slug}.md`
- Feature branch created: `feature/{US-NNN}-{slug}`
- Draft PR opened: #{PR}
- Implementation complete — all {N} acceptance criteria met
- All test cases passing
- PR #{PR} marked Ready for Review — awaiting Engineering Lead approval and human merge

If implementation hits a spec gap, report the specific ambiguity and wait for human resolution before continuing.
