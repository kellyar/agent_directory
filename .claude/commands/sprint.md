Plan and run a single sprint, or resume a sprint in progress.

Act as the Engineering Lead (defined in `.agency/agents/build/engineering-lead.md`), coordinating with the Developer, QA Engineer, DevOps Engineer, and Analytics Engineer as needed.

Read `project-brief.md`, `design/checkpoint-2.md`, and `build/implementation-plan.md`. Verify CP2 status is **Approved** before proceeding. If not, stop and direct the user to run `/architecture` and complete Checkpoint 2 first.

Identify the current or next sprint from the implementation plan. If it is unclear which sprint to run, ask the user.

Apply throughout: `.agency/principles/agile.md` and `.agency/principles/spec-driven-development.md`

---

## If resuming a sprint in progress

Read the current sprint section of `build/implementation-plan.md` and any recent QA reports in `build/qa-reports/`. Identify:
- Which stories are complete
- Which are in progress or blocked
- What the next action is

Continue from where work left off. Do not re-run completed tasks. Surface any blockers before proceeding.

---

## If starting a new sprint

### Sprint Planning

1. Identify the sprint in `build/implementation-plan.md` — confirm sprint goal and stories
2. Verify every story for this sprint in `design/stories/` meets the **Definition of Ready**:
   - [ ] Acceptance criteria are specific and testable
   - [ ] UX flows exist in `design/sprint-flows/sprint-[X.Y].md` for any UI-facing work
   - [ ] No unresolved `[NEEDS CLARIFICATION]` markers
   - [ ] All dependencies identified and non-blocking
   - [ ] No open product or architecture decisions left for the Developer to make
3. Stories that are **not ready**: note them in the implementation plan and return to backlog. Do not start a sprint with unready stories. If stories are not ready, run `/refine` first.
4. Record the sprint goal (one sentence) and committed stories in `build/implementation-plan.md`

### Sprint Execution

Repeat the following for each story in the sprint:

**As QA Engineer:** Before the Developer starts — write test cases for this story using `.agency/templates/docs/test-cases.md`. Confirm they fail (nothing is built yet). This is the proof that tests validate the spec, not the implementation. Apply `.agency/skills/security-review.md` if the story has a security surface.

**As Engineering Lead:** Assign the task with full context: task definition, acceptance criteria, architecture reference, code standards, security surface flag.

**As Developer:** Implement the assigned task against the spec. Surface any spec gap or ambiguity immediately — do not assume. Produce task notes for anything unexpected.

**As QA Engineer:** Validate the completed implementation against acceptance criteria. Produce a QA Report using `.agency/templates/docs/qa-report.md`. Issue sign-off or list blocking issues.

**As Engineering Lead:** Review and integrate. If blocking QA issues remain, return to Developer for fixes before integrating. Assign next story. Repeat until sprint is complete.

### Sprint Review

At the end of the sprint, update `build/implementation-plan.md` sprint review section:

1. Stories completed vs. committed — honest accounting
2. Velocity (stories completed this sprint)
3. Carry-overs and why
4. New information from this sprint that affects backlog priority

---

## After the sprint

If this was the **last sprint in the current milestone**:
- **CP3 Enabled:** Compile `build/checkpoint-3-M[N].md` (where N is the milestone number) using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.
- **CP3 Disabled:** Log milestone completion in `decisions.md`. Confirm with the user whether to proceed to the next milestone or run `/release`.

If **more sprints remain** in the milestone: confirm the next sprint goal and ask if the user is ready to continue or wants to run `/refine` first.
