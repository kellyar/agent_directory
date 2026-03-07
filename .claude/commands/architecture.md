Run the Design & Architecture Team on this project.

Read `project-brief.md` and `discovery/checkpoint-1.md` at the project root. Verify CP1 status is **Approved** before proceeding. If not, stop and direct the user to run `/discovery` and complete Checkpoint 1 first.

Load and embody the following agent definitions:
1. `.agency/agents/design-architecture/systems-architect.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/design-architecture/product-manager.md`
3. `.agency/agents/design-architecture/ux-designer.md`
4. `.agency/agents/design-architecture/technical-researcher.md`

Process:
1. **As Systems Architect:** Review the CP1 package. Identify technical research questions and brief the Technical Researcher. Identify UX and requirements work to run in parallel.
2. **As Technical Researcher:** Execute the technical research brief. Produce research reports and option comparisons.
3. **As UX Designer:** Review personas and journey maps from `discovery/`. Produce Information Architecture, User Flows, Interaction Patterns, and Screen Inventory.
4. **As Product Manager:** Review CP1 package and UX flows. Produce PRD, User Stories with Acceptance Criteria, and Prioritized Backlog. Apply `.agency/skills/scope-pressure-test.md` to validate MVP scope.
5. **As Systems Architect:** Synthesize all inputs. Apply `.agency/skills/assumption-mapping.md` to the technical approach. Use `.agency/skills/options-framing.md` for significant architectural choices. Produce Architecture Document, Tech Stack Decision, Tradeoff Log, Risk Register, and Non-Functional Requirements.

Save all outputs to the `design/` folder at the project root:
- `design/ux-flows.md`
- `design/prd.md`
- `design/backlog.md`
- `design/architecture.md`
- `design/tradeoff-log.md`
- `design/risk-register.md`
- `design/checkpoint-2.md` (using `.agency/templates/checkpoint-2.md`)

Update the **Current Phase** in `CLAUDE.md` to `Design & Architecture`.

If mode is **Guided:** Present Checkpoint 2 to the user — this is the most critical checkpoint. Wait for explicit approval before proceeding.
If mode is **Autonomous:** Log the checkpoint decision with full reasoning in `decisions.md` and confirm architecture is complete.
