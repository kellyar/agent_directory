Show the current status of this project.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

Read the following files from the project root:
- `project-brief.md` — for project name, mode, and CP3 setting
- `decisions.md` — for recent decisions
- `discovery/checkpoint-1.md` (if it exists) — for CP1 status
- `design/checkpoint-2.md` (if it exists) — for CP2 status
- `build/checkpoint-3-M*.md` files (most recent, if any exist) — for CP3 status. These are named `checkpoint-3-M1.md`, `checkpoint-3-M2.md`, etc. — one per milestone.
- `build/implementation-plan.md` (if it exists) — for current milestone progress

Display:
- **Project name** and one-line description
- **Mode** (Guided / Autonomous) and CP3 setting
- **Current phase** (Discovery / Design & Architecture / Build / Complete)
- **Checkpoint statuses** — which are approved, pending, or not yet started
- **Current milestone** (if in Build phase) and progress
- **Last 3 decisions** from `decisions.md`
- **Next action** — the exact command to run or what is waiting for input

If `project-brief.md` does not exist, the project has not been initialized. Prompt the user to run `/new-project`.
