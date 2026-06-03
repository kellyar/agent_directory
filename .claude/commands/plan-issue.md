Plan a GitHub issue into a full, ready story spec and open a plan PR for human review.

**Usage:** `/plan-issue <issue-number>` (e.g. `/plan-issue 13`)

If no argument is provided, fetch the most recent open issue labeled `status: ready-to-plan`.

Act as the Engineering Lead (`.agency/agents/build/engineering-lead.md`), coordinating with the Product Manager (`.agency/agents/design-architecture/product-manager.md`) and UX Designer (`.agency/agents/design-architecture/ux-designer.md`).

Read before starting: `project-brief.md`, `design/prd.md`, `design/architecture.md`, `build/implementation-plan.md`, `build/code-standards.md`.

Apply throughout: `.agency/principles/spec-driven-development.md`

---

## Step 1 — Fetch the issue

```bash
gh issue view {N} --json number,title,body,labels,comments
```

Extract: problem description, proposed solution, area of app affected, priority, any tester context or comments. Identify whether this is UI-facing work (affects any visible element or user interaction).

If the issue is not found or has label `status: planned` or `status: in progress`, stop and report — do not duplicate a plan that already exists.

## Step 2 — Determine next story number

```bash
ls design/stories/
```

Find the highest existing `US-NNN` number. The new story uses the next available number.

## Step 3 — Write the story spec

**As Product Manager** — create `design/stories/US-{N}-{slug}.md` using `.agency/templates/docs/user-story.md`:

- **Story:** "As [primary persona from `project-brief.md`], I want to [action derived from issue] so that [outcome]."
- **Context:** Reference the issue number and the problem it describes. Pull in any tester notes from the issue body or comments.
- **Acceptance Criteria:** Specific, testable, pass/fail. No vague criteria ("should work", "looks correct"). Minimum 5 criteria for any non-trivial story. Each must be independently verifiable.
- **Edge cases:** At minimum — empty state, maximum load, error/failure path, undo/redo interaction (if relevant).
- **Error states:** What the user sees when something goes wrong.
- **Dependencies:** Cross-reference any stories from `design/stories/` that must be complete first.
- **Out of scope:** Explicitly list anything mentioned in the issue that is NOT in this story, to prevent scope creep.
- Use `[NEEDS CLARIFICATION: <question>]` for genuine uncertainty — do not guess.
- Set status: **Draft** initially.

**As UX Designer** — for any UI-facing work, create `design/epic-flows/{slug}.md`:

- Document every screen state: default, hover, selected, loading, error, empty, max-content
- Specify every user interaction: clicks, drags, keyboard shortcuts, context menus
- Document all transitions and animations expected
- For any new component: specify dimensions, spacing, color tokens (reference existing patterns in `src/`)
- Reference the existing component structure in `src/` for any UI-facing work

## Step 4 — Validate Definition of Ready

**As Engineering Lead** — check every item:

- [ ] Acceptance criteria are specific and testable (every one could be independently verified by QA)
- [ ] UX flows exist for any UI-facing work
- [ ] All dependencies identified — cross-reference `design/stories/` for anything that must exist first
- [ ] Architecture context clear — which files in `src/` are affected, which patterns to follow per `build/code-standards.md`
- [ ] No unresolved `[NEEDS CLARIFICATION]` markers that would block a Developer from starting

If all pass: update story status to **Ready**.
If any fail: keep status as **Draft** and list the gaps explicitly in the plan PR description.

## Step 5 — Create plan branch and PR

```bash
git checkout main && git pull origin main
git checkout -b plan/issue-{N}
git add design/stories/US-{N}-{slug}.md
# If UX flows were created:
git add design/epic-flows/{slug}.md
git commit -m "plan: elaborate story spec for issue #{N}"
git push origin plan/issue-{N}
```

Create the PR:
```bash
gh pr create \
  --title "[Plan] Issue #{N}: {issue title}" \
  --label "type: plan" \
  --body "..."
```

**PR body must include:**
- `Closes #{N}` or `Related to #{N}` (use Closes only if the issue should auto-close on merge)
- One-paragraph summary of what this story delivers
- Link to the story spec: `design/stories/US-{N}-{slug}.md`
- Key acceptance criteria (top 5, formatted as a checklist)
- Definition of Ready status (pass/fail per item)
- Any open `[NEEDS CLARIFICATION]` items that need human resolution before build
- > ⚠️ **Merging this PR triggers the automated build workflow.** Only merge when you are ready for Claude to begin implementing this story.

## Step 6 — Update the issue

```bash
gh issue comment {N} --body "Implementation plan ready for review: #{PR-number}

Story spec: \`design/stories/US-{N}-{slug}.md\`
Definition of Ready: {pass|draft — see PR for gaps}"

gh issue edit {N} \
  --add-label "status: planned" \
  --remove-label "status: ready-to-plan"
```

---

## Output

Report:
- Issue #{N} fetched and summarised
- Story US-{N} written — status (Ready / Draft with gaps listed)
- UX flows written (or skipped if not UI-facing, with reason)
- Plan PR #{PR} opened
- Issue #{N} updated

If there are `[NEEDS CLARIFICATION]` markers remaining, list them explicitly so the human knows what to resolve before approving the plan PR.
