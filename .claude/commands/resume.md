Resume work on this project. Use this at the start of any new session to reload context before running any other command.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

Read the following files in order:
1. `project-brief.md` — project name, mode, CP3 setting, constraints
2. `decisions.md` — full decision log
3. `discovery/checkpoint-1.md` (if exists) — CP1 status and key outputs
4. `design/checkpoint-2.md` (if exists) — CP2 status and key outputs
5. Most recent `build/checkpoint-3-M*.md` file (if any exist) — most recent CP3 status (files named `checkpoint-3-M1.md`, `checkpoint-3-M2.md`, etc.)
6. `build/implementation-plan.md` (if exists) — current milestone and task progress

Then produce a concise session briefing in this structure:

---
**Project:** [name] | **Mode:** [Guided/Autonomous] | **Phase:** [current phase]

**Where we are:**
[2–3 sentences. What has been completed, what is in progress, where things stand.]

**Last decisions:**
[Bulleted list of the 3 most recent entries from decisions.md — date, what was decided]

**Open items:**
[Anything pending human input, approval, or a blocking issue]

**Next action:**
[Single clear statement — the exact command to run or the specific thing waiting on input]
---

After presenting the briefing, ask if the user is ready to continue or if they want to review any specific output before proceeding.
