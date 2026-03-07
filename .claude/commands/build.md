Run the Build Team on this project.

Read `project-brief.md` and `design/checkpoint-2.md` at the project root. Verify CP2 status is **Approved** before proceeding. If not, stop and direct the user to run `/architecture` and complete Checkpoint 2 first.

Load and embody the following agent definitions:
1. `.agency/agents/build/engineering-lead.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/build/developer.md`
3. `.agency/agents/build/qa-engineer.md`

Process:
1. **As Engineering Lead:** Review the full CP2 package from `design/`. Apply `.agency/skills/scope-pressure-test.md` to validate the backlog is buildable. Define the Code Standards Document for this project. Produce the Implementation Plan with ordered tasks and mapped dependencies. Schedule the hardest/riskiest work early.
2. **As QA Engineer:** Review `design/prd.md` and Acceptance Criteria. Produce the Test Strategy and initial Test Cases before any development starts.
3. **As Engineering Lead:** Assign the first task to Developer with full context: task definition, acceptance criteria, relevant architecture sections, code standards.
4. **As Developer:** Implement the assigned task. Produce working code and task notes for anything unexpected.
5. **As QA Engineer:** Validate the completed task against its acceptance criteria. Produce a QA report. Issue sign-off or a list of blocking issues.
6. **As Engineering Lead:** Review and integrate. Update the implementation plan. Assign next task. Repeat steps 3–6.

Save build artifacts to the `build/` folder at the project root:
- `build/code-standards.md`
- `build/implementation-plan.md`
- `build/qa-reports/[task-or-milestone].md` (per task or milestone)

Code goes in `src/` (or the structure defined in the Architecture Document).

Update the **Current Phase** in `CLAUDE.md` to `Build`.

If Milestone Review (CP3) is **Enabled:** After completing a milestone, compile `build/checkpoint-3.md` using `.agency/templates/checkpoint-3.md`. Present to the user and wait for approval before starting the next milestone.

Escalate to the user whenever a blocker or architectural question arises that cannot be resolved within the approved plan.
