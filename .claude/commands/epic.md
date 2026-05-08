Run a single epic end-to-end: elaborate stories, get human approval, build, then review.

Act as the Engineering Lead (defined in `.agency/agents/build/engineering-lead.md`), coordinating with the Product Manager, UX Designer, Developer, QA Engineer, DevOps Engineer, and Analytics Engineer as needed.

Read `project-brief.md`, `design/checkpoint-2.md`, and `build/implementation-plan.md`. Verify CP2 status is **Approved** before proceeding.

Identify the next epic from the prioritised backlog in `build/implementation-plan.md`, or use the epic specified by the user.

Apply throughout: `.agency/principles/spec-driven-development.md`

---

## If resuming an epic in progress

Read the current epic section of `build/implementation-plan.md` and any QA reports in `build/qa-reports/`. Identify:
- Which stories are complete
- Which are in progress or blocked
- What the next action is

Continue from where work left off. Do not re-run completed stories. Surface any blockers before proceeding.

---

## If starting a new epic

### Step 1 — Elaborate stories (if not already Ready)

If the epic's stories are already in `design/stories/` and marked **Ready**, skip to Step 2.

Otherwise, run the elaboration process:

**As Product Manager:** Elaborate the epic into detailed user stories using `.agency/templates/docs/user-story.md`:
- Write full acceptance criteria — specific, testable, pass/fail
- Specify edge cases and error states — informed by anything already built in prior epics
- Use `[NEEDS CLARIFICATION]` for any genuine uncertainty — these are gates, not notes
- Save each story to `design/stories/[US-XXX]-[slug].md`

**As UX Designer:** For each story with UI-facing work, produce detailed screen specs:
- All screen states: empty, loading, error, partial data, full
- All interactions, validations, edge cases
- Save to `design/epic-flows/[epic-slug].md`
- Incorporate learnings from screens already built

**As Engineering Lead:** Review each story against the Definition of Ready:
- [ ] Acceptance criteria are specific and testable
- [ ] UX flows exist for any UI-facing work
- [ ] All dependencies are identified and non-blocking
- [ ] Architecture context is clear — which component, which patterns to follow
- [ ] No open questions requiring a product or architecture decision mid-task
- [ ] No unresolved `[NEEDS CLARIFICATION]` markers

Stories that fail: return to PM or UX Designer with specific feedback. Do not proceed until all stories are Ready.

### Step 2 — Present scope to human

Present the epic scope clearly:
- Epic name and goal
- Stories in build order (list with one-line summaries)
- Any dependencies on prior epics
- Estimate of complexity (rough — not story points)
- Any risks or open questions

Wait for explicit human approval before building. This is the commitment gate.

### Step 3 — Build

For each story in the epic, in dependency order:

**As QA Engineer:** Write test cases for this story using `.agency/templates/docs/test-cases.md` **before the Developer starts**. Confirm they fail (nothing is built yet). Apply `.agency/skills/security-review.md` if the story has a security surface.

**As Engineering Lead:** Assign the story with full context: acceptance criteria, architecture reference, code standards, security surface flag.

**As Developer:** Create a feature branch (`feature/US-[XXX]-[slug]`) from latest `main`. Open a Draft PR immediately. Implement against the spec. Surface spec gaps immediately — do not assume. See `.agency/skills/github-workflow.md`.

**As QA Engineer:** After implementation — validate on the feature branch. Produce a QA Report (`build/qa-reports/[story-slug].md`). **Comment sign-off status on the PR.** If blocking issues remain, the PR stays Draft.

**As Developer:** Once QA has signed off, mark the PR **Ready for Review**.

**As Engineering Lead:** Review the PR for spec compliance, code quality, standards adherence, and security. Approve when satisfied. Do not merge — approval signals to the human the PR is ready. The human merges to `main`.

Repeat for all stories in the epic.

### Step 4 — Epic review

When all stories in the epic are merged, present an epic completion summary:

1. What was built (stories completed)
2. Did the epic meet its acceptance criteria?
3. Any divergence from the plan and why
4. Learnings that should shape how the next epic's stories are written
5. Wiki: update `wiki/pages/` if any technical decisions or patterns emerged worth recording; update `wiki/index.md`

Update the epic status in `build/implementation-plan.md` to **Complete**.

---

## After the epic

If this was the **last epic in the current milestone**:
- **CP3 Enabled:** Compile `build/checkpoint-3-M[N].md` using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.
- **CP3 Disabled:** Log milestone completion in `decisions.md`. Confirm with the user whether to proceed to the next milestone or run `/release`.

If **more epics remain**: confirm the next epic and ask if the user is ready to continue or wants to run `/refine` to preview the next epic's stories first.
