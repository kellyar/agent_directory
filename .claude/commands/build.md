Run the Build Team on this project.

Read `project-brief.md` and `design/checkpoint-2.md` at the project root. Verify CP2 status is **Approved** before proceeding. If not, stop and direct the user to run `/architecture` and complete Checkpoint 2 first.

Load and embody the following agent definitions:
1. `.agency/agents/build/engineering-lead.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/build/developer.md`
3. `.agency/agents/build/qa-engineer.md`
4. `.agency/agents/build/devops-engineer.md`
5. `.agency/agents/build/analytics-engineer.md`

Process:

**Setup phase — before any code is written:**
1. **As Engineering Lead:** Review the full CP2 package from `design/`. Apply `.agency/skills/scope-pressure-test.md` to validate the backlog is buildable. Define the Code Standards Document using `.agency/templates/docs/code-standards.md`. Produce the Implementation Plan using `.agency/templates/docs/implementation-plan.md` — ordered tasks, mapped dependencies, riskiest work scheduled early.
2. **As DevOps Engineer:** Review the Architecture Document and NFRs. Produce the Infrastructure Plan using `.agency/templates/docs/infrastructure-plan.md`. Set up CI/CD pipeline and environments before Developers begin committing code.
3. **As QA Engineer:** Review `design/prd.md` and all stories in `design/stories/`. Produce the Test Strategy using `.agency/templates/docs/test-strategy.md` and initial Test Cases using `.agency/templates/docs/test-cases.md`. Apply `.agency/skills/security-review.md` to any feature with a security surface.
4. **As Analytics Engineer:** Review the success metrics in `design/prd.md` and UX flows in `design/ux-flows.md`. Produce the Analytics Plan using `.agency/templates/docs/analytics-plan.md`. Flag any success metric that cannot be measured as defined — escalate to PM before proceeding.

**Build loop — repeat until milestone complete:**
5. **As Engineering Lead:** Verify each task meets the Definition of Ready before assigning. Assign the next task to Developer with full context: task definition, acceptance criteria, relevant architecture sections, code standards, and whether a security review is required.
6. **As Developer:** Implement the assigned task. Produce working code and task notes for anything unexpected.
7. **As QA Engineer:** Validate the completed task against its acceptance criteria. Apply `.agency/skills/security-review.md` if the task has a security surface. Produce a QA Report using `.agency/templates/docs/qa-report.md`. Issue sign-off or a list of blocking issues.
8. **As Engineering Lead:** Review and integrate. Update the implementation plan actuals. Repeat steps 5–7 for the next task.

Save build artifacts to the `build/` folder at the project root:
- `build/code-standards.md` (from `.agency/templates/docs/code-standards.md`)
- `build/implementation-plan.md` (from `.agency/templates/docs/implementation-plan.md`)
- `build/infrastructure-plan.md` (from `.agency/templates/docs/infrastructure-plan.md`)
- `build/analytics-plan.md` (from `.agency/templates/docs/analytics-plan.md`)
- `build/test-strategy.md` (from `.agency/templates/docs/test-strategy.md`)
- `build/test-cases/[milestone-or-feature].md` (from `.agency/templates/docs/test-cases.md`)
- `build/qa-reports/[task-or-milestone].md` (from `.agency/templates/docs/qa-report.md`)

Code goes in `src/` (or the structure defined in `design/architecture.md`).

Update the **Current Phase** in `CLAUDE.md` to `Build`.

If Milestone Review (CP3) is **Enabled:** After completing a milestone, compile `build/checkpoint-3.md` using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.

When the final milestone is complete, prompt the user to run `/release`.

Escalate to the user whenever a blocker or architectural question arises that cannot be resolved within the approved plan.
