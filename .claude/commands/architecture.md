Run the Design & Architecture Team on this project.

Read `project-brief.md` and `discovery/checkpoint-1.md` at the project root. Verify CP1 status is **Approved** before proceeding. If not, stop and direct the user to run `/discovery` and complete Checkpoint 1 first.

Load and embody the following agent definitions:
1. `.agency/agents/design-architecture/systems-architect.md` (Team Lead — you orchestrate the team)
2. `.agency/agents/design-architecture/product-manager.md`
3. `.agency/agents/design-architecture/ux-designer.md`
4. `.agency/agents/design-architecture/technical-researcher.md`

This phase produces **structural decisions and epic-level scope** — not fully elaborated stories. Stories are elaborated just-in-time during backlog refinement, one sprint before they are built. See `.agency/principles/agile.md`.

---

## Process

**1. As Systems Architect:** Review the CP1 package. Identify structural technical questions that must be resolved before architecture can be committed — brief the Technical Researcher on these. Structural decisions include: component boundaries, data model, tech stack, service interfaces, auth approach, infrastructure topology. Component-level implementation decisions are deferred to just-in-time during build.

**2. As Technical Researcher:** Execute the research brief. Produce research reports using `.agency/templates/docs/technical-research-report.md`.

**3. As UX Designer:** Review personas and journey maps from `discovery/`. Produce:
- Information architecture and navigation model
- Key user flows — happy-path flows for each persona's primary jobs to be done (enough for the Architect to understand data flow and auth boundaries)
- Screen inventory — names and purposes of all distinct views, not detailed specs
- Interaction principles — product-wide UX decisions
Use `.agency/templates/docs/ux-flows.md` for structure. Detailed screen specs for each screen will be produced per sprint during build.

**4. As Product Manager:** Review CP1 package and UX flows. Produce:
- PRD using `.agency/templates/docs/prd.md` — fully populate Business Goals, Functional Requirements (at epic/feature level), Non-Functional Requirements, and Business Rules
- Epics using `.agency/templates/docs/epic.md` (one per major feature area) — with rough size estimates and epic-level acceptance criteria. Do NOT elaborate into detailed user stories at this stage.
- Prioritised epic backlog with MVP line clearly marked
Apply `.agency/skills/scope-pressure-test.md` to validate the MVP epic set.

**5. As Systems Architect:** Synthesise all inputs. Apply `.agency/skills/assumption-mapping.md` to the technical approach. Use `.agency/skills/options-framing.md` for significant architectural choices. Produce full Architecture Document, Tradeoff Log, and Risk Register.

---

## Saved Outputs

```
design/
  technical-research-report.md     (.agency/templates/docs/technical-research-report.md)
  ux-flows.md                       (.agency/templates/docs/ux-flows.md — IA, key flows, screen inventory)
  prd.md                            (.agency/templates/docs/prd.md)
  epics/
    EP-001-[slug].md                (.agency/templates/docs/epic.md — one per epic)
  stories/                          ← empty at CP2; populated during backlog refinement
  architecture.md                   (.agency/templates/docs/architecture.md)
  tradeoff-log.md                   (.agency/templates/docs/tradeoff-log.md)
  risk-register.md                  (.agency/templates/docs/risk-register.md)
  checkpoint-2.md                   (.agency/templates/checkpoint-2.md)
```

Update the **Current Phase** in `CLAUDE.md` to `Design & Architecture`.

If mode is **Guided:** Present Checkpoint 2 to the user — this is the most critical checkpoint. Wait for explicit approval before proceeding.
If mode is **Autonomous:** Log the checkpoint decision with full reasoning in `decisions.md` and confirm architecture is complete.
