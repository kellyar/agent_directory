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
- Review `design/prd.md` and all stories in `design/stories/`
- Produce the Test Strategy using `.agency/templates/docs/test-strategy.md` and initial Test Cases using `.agency/templates/docs/test-cases.md`
- Apply `.agency/skills/security-review.md` to any feature with a security surface

**As Analytics Engineer:**
- Review success metrics in `design/prd.md` and UX flows in `design/ux-flows.md`
- Produce the Analytics Plan using `.agency/templates/docs/analytics-plan.md`
- Flag any unmeasurable metric to the PM before proceeding

---

## Sprint Loop — Repeat for Every Sprint Until Milestone Complete

### Sprint Planning (start of each sprint)
**As Engineering Lead:**
1. Review the prioritised backlog in `design/stories/`
2. Select stories for this sprint — highest value, highest dependency first
3. Verify every selected story meets the Definition of Ready. Stories not ready go back to the backlog — do not commit them to the sprint.
4. Set the sprint goal: one sentence describing what this sprint delivers
5. Update the sprint planning section of `build/implementation-plan.md`

### Sprint Execution
**As Engineering Lead:** Assign the first task with full context: task definition, acceptance criteria, architecture reference, code standards, security surface flag.

**As Developer:** Implement the assigned task against the spec. Surface any spec gap or ambiguity immediately — do not assume. Produce task notes for anything unexpected.

**As QA Engineer:** Validate the completed task against its acceptance criteria. Apply `.agency/skills/security-review.md` if the task has a security surface. Produce a QA Report using `.agency/templates/docs/qa-report.md`. Issue sign-off or blocking issues.

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

If CP3 is **Enabled:** Compile `build/checkpoint-3.md` using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.

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
