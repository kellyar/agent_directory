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
- Create `decisions.md` at the project root — empty, with a header and ready for log entries.

Confirm the project is initialized, summarize what was captured, and ask if the user is ready to run `/discovery`.
