Run a project retrospective and apply learnings back to the agency framework.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`), coordinating all Team Leads.

Read all project artifacts: `project-brief.md`, `decisions.md`, all checkpoint files, all discovery/design/build outputs.

Step 1 — Phase reviews:
Embody each Team Lead in turn and evaluate their phase honestly:

**As Product Strategist:** Review the discovery phase. Did the problem statement hold up? Were personas accurate? Did the assumption map identify the real risks?

**As Systems Architect:** Review the design and architecture phase. Did the architecture hold up under build? Were the tradeoffs logged actually the right ones? Did any risks from the risk register materialise?

**As Engineering Lead:** Review the build phase. Was the implementation plan realistic? Did the Definition of Ready prevent mid-task blockers? Did code standards hold? Were QA and DevOps involved early enough?

Step 2 — Produce the retrospective document:
Create `retrospective-[YYYY-MM-DD].md` at the project root using `.agency/templates/retrospective.md`. Fill in all sections with honest, specific observations — not generalities.

Step 3 — Propose agency improvements:
For each observation, identify whether it points to a specific improvement in `.agency/`. Be concrete:
- "The assumption map template needs a column for validation method"
- "The QA Engineer should ask about analytics instrumentation earlier"
- "Add a Definition of Ready check to the discovery command"

Do not propose vague improvements. If you cannot identify a specific file and change, note it as an observation only.

Step 4 — Present and get approval:
Present the consolidated improvement proposals to the user, ranked by impact. For each:
- What file would change
- What the change is
- Why it would improve future projects

Ask the user to approve, defer, or reject each proposed change.

Step 5 — Apply approved changes:
For each approved change:
1. Edit the relevant file in `.agency/` (remember: this repo is at `.agency/` in the project repo — edit those files directly)
2. Confirm the change with the user

Step 6 — Commit and update:
```bash
cd .agency
git add .
git commit -m "Retrospective improvements from [project-name]: [brief summary]"
git push origin main
cd ..
git add .agency
git commit -m "Update agency to retrospective commit from [project-name]"
```

Log all applied changes in `decisions.md`.
