Run the Build Team on this project.

Read `project-brief.md` and `design/checkpoint-2.md` at the project root. Verify CP2 status is **Approved** before proceeding. If not, stop and direct the user to run `/architecture` and complete Checkpoint 2 first.

Load and embody the following agent definitions:
1. `.agency/agents/build/engineering-lead.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/build/developer.md`
3. `.agency/agents/build/qa-engineer.md`
4. `.agency/agents/build/devops-engineer.md`
5. `.agency/agents/build/analytics-engineer.md`

Apply throughout: `.agency/principles/agile.md` and `.agency/principles/spec-driven-development.md`

Before each action, apply `.agency/skills/skill-check.md` — scan for applicable skills and invoke before proceeding.

**Model cost optimisation:** When dispatching subagents, use the least-powerful model that can handle the role. Mechanical tasks (writing code against a defined spec, running tests) use fast, cheap models. Architecture decisions, ambiguity resolution, and security review require capable models.

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

## Epic Loop — Repeat for Every Epic Until Milestone Complete

Run each epic using `/epic`. The sequence per epic is:

1. **Elaborate stories** — PM and UX Designer produce ready stories for the epic (run `/refine` first if you want to review stories before committing to the epic)
2. **Human approves scope** — Engineering Lead presents stories to human; build does not start without explicit approval
3. **Build** — story by story in dependency order: QA writes tests → Developer implements → QA validates → Engineering Lead reviews PR → human merges
4. **Epic review** — Engineering Lead presents what was built, whether the epic met its acceptance criteria, and any learnings that should shape the next epic's stories

To re-enter mid-epic in a new session, run `/epic` — it will resume from where work left off.

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
