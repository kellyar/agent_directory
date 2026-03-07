Run the Build Team on this project.

Read `project-brief.md` and `design/checkpoint-2.md` at the project root. Verify CP2 status is **Approved** before proceeding. If not, stop and direct the user to run `/architecture` and complete Checkpoint 2 first.

Load and embody the following agent definitions:
1. `.agency/agents/build/engineering-lead.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/build/developer.md`
3. `.agency/agents/build/qa-engineer.md`
4. `.agency/agents/build/devops-engineer.md`
5. `.agency/agents/build/analytics-engineer.md`

Apply throughout: `.agency/principles/agile.md` and `.agency/principles/spec-driven-development.md`

---

## Setup Phase — Before Any Code Is Written

**As Engineering Lead:**
- Apply `.agency/skills/scope-pressure-test.md` to validate the backlog is buildable
- Define the Code Standards Document using `.agency/templates/docs/code-standards.md`
- Produce the Implementation Plan using `.agency/templates/docs/implementation-plan.md` — organised into milestones and sprints, riskiest work scheduled early

**As DevOps Engineer:**
- Review the Architecture Document and NFRs from `design/`
- Produce the Infrastructure Plan using `.agency/templates/docs/infrastructure-plan.md`
- Set up CI/CD pipeline and environments — this must be complete before Developers commit code

**As QA Engineer:**
- Review `design/prd.md`, `design/epics/`, and `design/architecture.md`
- Produce the Test Strategy using `.agency/templates/docs/test-strategy.md`. This is the only QA artifact produced at build setup. Test cases are written per sprint — before each story's Developer starts, confirmed failing before implementation begins. See the sprint execution section below.
- Apply `.agency/skills/security-review.md` to any epic with a security surface to inform the test strategy risk priorities

**As Analytics Engineer:**
- Review success metrics in `design/prd.md` and UX flows in `design/ux-flows.md`
- Produce the Analytics Plan using `.agency/templates/docs/analytics-plan.md`
- Flag any unmeasurable metric to the PM before proceeding

---

## Sprint Loop — Repeat for Every Sprint Until Milestone Complete

### Backlog Refinement (during current sprint, for the next sprint)
This runs during the current sprint — not at the start of the next one. Refinement keeps sprint planning from being blocked on unready stories.

**As Product Manager:** Take the next sprint's epics from `design/epics/`. Elaborate them into detailed user stories using `.agency/templates/docs/user-story.md`. Write full acceptance criteria, edge cases, and error states — informed by what building previous sprints has revealed. Save to `design/stories/[US-XXX]-[slug].md`.

**As UX Designer:** Produce detailed screen specs for the next sprint's stories. All states (empty, loading, error, partial, full), all interactions, all edge cases. Update `design/ux-flows.md` with a sprint-specific section, or create `design/sprint-flows/sprint-[N].md`. Incorporate learnings from screens already built.

**As Engineering Lead:** Review each elaborated story against the Definition of Ready. Stories not ready are returned to the PM for more elaboration — do not carry unready stories into sprint planning.

### Sprint Planning (start of each sprint)
**As Engineering Lead:**
1. Review the refined stories in `design/stories/` — these have already passed the Definition of Ready check during refinement
2. Select stories for this sprint — highest value, highest dependency first
3. Confirm sprint goal: one sentence describing what this sprint delivers
4. Update the sprint planning section of `build/implementation-plan.md`

### Sprint Execution
**As Engineering Lead:** Assign the first task with full context: task definition, acceptance criteria, architecture reference, code standards, security surface flag.

**As Developer:** Implement the assigned task against the spec. Surface any spec gap or ambiguity immediately — do not assume. Produce task notes for anything unexpected.

**As QA Engineer:** Before the Developer starts — write test cases for this story using `.agency/templates/docs/test-cases.md`. Confirm they fail (nothing is built yet). This is the proof that tests validate the spec, not the implementation. Apply `.agency/skills/security-review.md` if the story has a security surface. Then, after the Developer completes implementation, validate against acceptance criteria, produce a QA Report using `.agency/templates/docs/qa-report.md`, and issue sign-off or list blocking issues.

**As Engineering Lead:** Review and integrate. If QA issues are blocking, assign back for fixes before integrating. Assign next task. Repeat until sprint stories are complete.

### Sprint Review (end of each sprint)
**As Engineering Lead:**
1. Record what was completed vs. committed
2. Record velocity (stories completed)
3. Note anything carried over and why
4. Re-prioritise backlog if sprint revealed new information
5. Update `build/implementation-plan.md` sprint review section

---

## Milestone Completion

When all sprints in a milestone are complete:

If CP3 is **Enabled:** Compile `build/checkpoint-3-M[N].md` (where N is the milestone number, e.g. `checkpoint-3-M1.md`) using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.

If CP3 is **Disabled:** Log milestone completion in `decisions.md` and begin planning the next milestone.

---

## Saved Artifacts

- `build/code-standards.md`
- `build/implementation-plan.md`
- `build/infrastructure-plan.md`
- `build/analytics-plan.md`
- `build/test-strategy.md`
- `build/test-cases/[feature].md`
- `build/qa-reports/[sprint-or-task].md`
- Code in `src/` (or structure per `design/architecture.md`)

Update **Current Phase** in `CLAUDE.md` to `Build`.

When the final milestone is complete, prompt the user to run `/release`.

Escalate to the user whenever a blocker or out-of-spec decision arises that cannot be resolved within the approved plan.

To re-enter the build phase mid-sprint in a new session without re-running setup, use `/sprint` to resume from where work left off.
