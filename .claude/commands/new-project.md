Initialize a new project in this repository.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

Collect the following from the user:
1. Project name
2. The idea/vision — encourage them to share as much or as little as they have
3. Any known constraints (timeline, technology preferences, budget signals, non-negotiables)
4. Mode: **Guided** (user approves each checkpoint) or **Autonomous** (agents run end-to-end, decisions are logged)
5. Milestone Review (Checkpoint 3): **Enabled** or **Disabled**
6. GitHub repo URL for this project

Once collected:
- Create `project-brief.md` at the project root using `.agency/templates/project-brief.md` as the template. Fill in everything known from the conversation.
- Create `decisions.md` at the project root using `.agency/templates/decisions.md` as the template. Leave the log empty and ready for entries.
- Create `context.md` at the project root using `.agency/templates/context.md` as the template. Set the current state to: Phase = Discovery, In progress = n/a, Next session = "Run /discovery".
- Update `CLAUDE.md` at the project root: replace the placeholder in "About This Project" with the actual project name and a one-line description based on what was collected. Update "Current Phase" to `Discovery`.

Confirm the project is initialized, summarize what was captured, and ask if the user is ready to run `/discovery`.
