Run backlog refinement for the next sprint.

Act as the Product Manager (defined in `.agency/agents/design-architecture/product-manager.md`) and UX Designer (defined in `.agency/agents/design-architecture/ux-designer.md`), coordinated by the Engineering Lead (`.agency/agents/build/engineering-lead.md`).

Backlog refinement runs during the *current* sprint, for the *next* sprint — not at sprint start. Its purpose is to ensure stories are Ready before sprint planning, so planning is never blocked on unready work.

Read `project-brief.md`, `design/checkpoint-2.md`, `build/implementation-plan.md`, and the epics in `design/epics/` to identify which epic(s) are next in priority. Read the most recent sprint review section in `build/implementation-plan.md` for learnings to apply.

Apply: `.agency/principles/agile.md` and `.agency/principles/spec-driven-development.md`

---

## Process

**As Product Manager:**

1. Identify the next sprint's epics from the prioritised backlog in `design/epics/`
2. Elaborate each epic into detailed user stories using `.agency/templates/docs/user-story.md`:
   - Write full acceptance criteria — specific, testable, pass/fail
   - Specify edge cases and error states — informed by what building previous sprints has revealed
   - Incorporate learnings from previous sprint reviews
   - Use `[NEEDS CLARIFICATION]` for any genuine uncertainty — these are gates, not notes. They must be resolved before the story can be marked Ready.
3. Save each story to `design/stories/[US-XXX]-[slug].md`

**As UX Designer:**

1. For each elaborated story that has UI-facing work, produce detailed screen specs using `.agency/templates/docs/sprint-flow.md`
2. Document all screen states: empty, loading, error, partial data, full
3. Specify all interactions, validations, and edge cases
4. Incorporate learnings from previous sprints — what did building previous screens teach us?
5. Save to `design/sprint-flows/sprint-[X.Y].md` (where X.Y is the next sprint number)

**As Engineering Lead:**

Review each story against the Definition of Ready:
- [ ] Acceptance criteria are specific and testable
- [ ] UX flows exist for any UI-facing work
- [ ] All dependencies are identified and either complete or confirmed non-blocking
- [ ] Architecture context is clear — which component, which patterns to follow
- [ ] No open questions requiring a product or architecture decision mid-task
- [ ] No unresolved `[NEEDS CLARIFICATION]` markers

Stories that **pass**: update status to **Ready** in `design/stories/[story].md`.

Stories that **fail**: return to PM or UX Designer with specific feedback on what is missing. Do not mark as Ready until resolved.

---

## Output

Confirm:
- How many stories are now Ready for the next sprint
- Any stories returned for more elaboration, with specific reasons
- Whether the next sprint's Ready story count is sufficient given prior velocity

If the next sprint cannot be filled with Ready stories, flag this to the user before sprint planning begins — do not start a sprint with unready stories.
