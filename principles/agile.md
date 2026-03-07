# Principle: Agile Engineering

## How Agile Applies Here

This organisation builds software iteratively, delivering working increments that can be reviewed and course-corrected — not big-bang releases at the end of a long build. Agile is not a ceremony set; it is a set of beliefs about how good software gets built.

**Core beliefs:**
- Working software over comprehensive documentation — but our specs *enable* working software, so they are not in conflict
- Responding to change over following a plan — which is why we have a formal scope-change process rather than pretending change doesn't happen
- Delivering value incrementally — which is why we have an explicit MVP line and milestone structure
- Quality is built in, not inspected at the end — which is why QA and DevOps are involved from the start of every build

---

## Structure: Milestones and Sprints

The build phase is organised into two levels:

**Milestones** — feature-complete increments of the product. A milestone ends with something demonstrably working that didn't exist before. Milestones are defined at CP2 and tracked in the implementation plan. If CP3 is enabled, each milestone has a review before the next begins.

**Sprints** — the working cadence within a milestone. A sprint is a fixed batch of stories selected from the prioritised backlog, executed by the team, and reviewed before the next sprint begins. Sprints keep work visible, surface problems early, and give the Engineering Lead a feedback loop for re-planning.

```
Milestone 1
  ├── Sprint 1.1  →  Sprint Review
  ├── Sprint 1.2  →  Sprint Review
  └── Sprint 1.3  →  Sprint Review → Milestone Review (CP3 if enabled)
Milestone 2
  ├── Sprint 2.1  →  Sprint Review
  └── ...
```

---

## Sprint Structure

### Sprint Planning
Runs at the start of every sprint. Led by the Engineering Lead.

1. Review the prioritised backlog — highest value, highest dependency stories first
2. Select stories for the sprint — the Engineering Lead decides how many fit based on story complexity and prior velocity
3. Verify every selected story meets the **Definition of Ready** before committing it to the sprint. Stories that are not ready go back to the backlog.
4. Set the sprint goal: one sentence that describes what the sprint delivers

### Sprint Execution
The build loop: plan task → Developer implements → QA validates → Engineering Lead integrates → repeat.

The Engineering Lead tracks progress against the sprint commitment daily. If a story is blocked or significantly more complex than anticipated, it is surfaced immediately — not discovered at the end of the sprint.

### Sprint Review
Runs at the end of every sprint. Led by the Engineering Lead.

1. What was completed vs. committed — honest accounting
2. What was carried over and why
3. Any new information that changes backlog priority
4. Velocity for this sprint (stories completed) — used to calibrate the next sprint

Sprint reviews are not retrospectives. They are fast, factual assessments of the sprint outcome. The retrospective is a separate, deeper process run at milestone or project end.

---

## Ceremonies: What Applies, What Doesn't

| Ceremony | Applies? | How |
|----------|----------|-----|
| Sprint planning | Yes | Engineering Lead runs before every sprint |
| Sprint review | Yes | Engineering Lead runs at end of every sprint |
| Milestone review | Yes | Maps to CP3 — optional, enabled per project |
| Retrospective | Yes | `/retrospective` command — run at milestone or project end |
| Daily standup | No | Agents don't have time between sessions — status is always visible in the implementation plan |
| Backlog grooming | Lightweight | Engineering Lead re-prioritises backlog at each sprint review |

---

## Backlog Management

The backlog is the single source of truth for what gets built. It is owned by the Product Manager and prioritised by value and dependency.

**Principles:**
- The backlog is always prioritised. The top story is always the most important thing to build next.
- Stories enter the sprint only when they meet the Definition of Ready
- Stories are never added to the current sprint mid-sprint without Engineering Lead sign-off. New work goes to the backlog and is prioritised for the next sprint.
- The MVP line in the backlog is fixed unless a formal scope-change is approved

---

## Velocity

Velocity is the number of stories (or story points, if estimated) completed per sprint. The Engineering Lead tracks this from sprint one.

**Purpose:** Velocity is used to plan, not to judge. It tells the Engineering Lead how much fits in a sprint. It tells the human whether the current plan is achievable. It is never used to pressure the team to go faster.

**How it's tracked:** In the implementation plan actuals table — sprints completed, stories committed, stories completed.

---

## Agile and Spec-Driven Development Together

These principles reinforce each other:

- Agile says: deliver incrementally, respond to change
- Spec-driven says: know what you're building before you build it

They are not in conflict. Agile does not mean "figure it out as you go." It means "deliver in iterations, and be honest when the plan changes." Spec-driven ensures each iteration is well-defined before it begins. The scope-change process is how change is handled without abandoning the spec discipline.

The result: each sprint starts with a clear, complete spec. The team executes with confidence. When reality diverges from the plan, it is surfaced through process — not discovered after the fact.
