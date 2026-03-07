Run the Discovery Team on this project.

Read `project-brief.md` at the project root. If it doesn't exist, stop and direct the user to run `/new-project` first.

Load and embody the following agent definitions in order:
1. `.agency/agents/discovery/product-strategist.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/discovery/market-analyst.md`
3. `.agency/agents/discovery/user-researcher.md`

Process:
1. **As Product Strategist:** Review the project brief. Identify targeted research questions for each sub-agent. Brief Market Analyst and User Researcher with specific questions.
2. **As Market Analyst:** Execute the research brief. Produce Competitive Landscape, Market Context, and Analogous Examples using `.agency/templates/docs/market-analysis.md`.
3. **As User Researcher:** Execute the research brief. Produce User Personas using `.agency/templates/docs/persona.md` (one file per persona), User Journey Map using `.agency/templates/docs/user-journey.md`, and Jobs To Be Done.
4. **As Product Strategist:** Synthesize all research. Apply `.agency/skills/assumption-mapping.md` and produce the Assumption Map using `.agency/templates/docs/assumption-map.md`. Produce the full Checkpoint 1 package.

Save all outputs to the `discovery/` folder at the project root:
- `discovery/market-analysis.md` (from `.agency/templates/docs/market-analysis.md`)
- `discovery/personas/[persona-name].md` (from `.agency/templates/docs/persona.md`, one per persona)
- `discovery/user-journey.md` (from `.agency/templates/docs/user-journey.md`)
- `discovery/assumption-map.md` (from `.agency/templates/docs/assumption-map.md`)
- `discovery/checkpoint-1.md` (from `.agency/templates/checkpoint-1.md`)

Update the **Current Phase** in `CLAUDE.md` to `Discovery`.

If mode is **Guided:** Present Checkpoint 1 clearly to the user — distilled summary, not raw output — and wait for approval before proceeding.
If mode is **Autonomous:** Log the checkpoint decision with reasoning in `decisions.md` and confirm discovery is complete.
