Handle a proposed scope change for this project.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

Read `project-brief.md`, `design/checkpoint-2.md` (if exists), and `build/implementation-plan.md` (if exists) to understand the current approved state.

Step 1 — Capture the change:
Ask the user to describe: what is changing and why?

Step 2 — Assess the tier:
Determine which tier the change falls into:
- **Tier 1 (Small):** A new story or modified acceptance criteria that fits within the approved architecture and scope boundary. No new capabilities, no architectural impact.
- **Tier 2 (Medium):** A new feature or meaningful scope addition that fits within the approved architecture but wasn't in the approved backlog. Requires CP2 re-approval for affected sections.
- **Tier 3 (Major):** A change that affects the architecture, the solution direction, or the approved scope boundary. Requires returning to the appropriate phase for rework and full checkpoint re-approval.

Step 3 — Document the change:
Create `[YYYY-MM-DD]-scope-change-[slug].md` in a `changes/` folder at the project root using `.agency/templates/scope-change-request.md`. Fill in the full impact assessment.

Step 4 — Present and get approval:
In Guided mode: present the change, tier assessment, and re-work path clearly to the user. Wait for explicit approval before proceeding.
In Autonomous mode: if Tier 1, log and proceed. If Tier 2 or 3, pause and escalate to the user — these tiers require human approval regardless of mode.

Step 5 — Execute:
- **Tier 1:** PM updates PRD and affected stories. Engineering Lead updates implementation plan. Log in `decisions.md`.
- **Tier 2:** PM updates PRD and stories. Reload `.agency/agents/design-architecture/systems-architect.md` to assess architecture impact. Present updated CP2 sections for re-approval. Engineering Lead updates implementation plan after approval.
- **Tier 3:** Identify which phase to return to. Advise the user on what needs to be re-run (`/discovery` or `/architecture`). Do not proceed with build until the appropriate checkpoint is re-approved.

Always log the final decision in `decisions.md` regardless of tier or outcome.
