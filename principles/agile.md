# Principle: Agile Engineering

## How Agile Applies Here

This organisation builds software iteratively, delivering working increments that can be reviewed and course-corrected — not big-bang releases at the end of a long build. Agile is not a ceremony set; it is a set of beliefs about how good software gets built.

**Core beliefs:**
- Working software over comprehensive documentation — but our specs *enable* working software, so they are not in conflict
- Responding to change over following a plan — which is why we have a formal scope-change process rather than pretending change doesn't happen
- Delivering value incrementally — which is why we have an explicit MVP line and milestone structure
- Quality is built in, not inspected at the end — which is why QA and DevOps are involved from the start of every build

---

## Just-In-Time Specification

A common mistake is treating "spec-driven" as meaning "spec everything upfront." It doesn't. It means the spec exists before the work begins — not that it must exist months before.

Writing detailed specifications too early produces waste: requirements change as you build, UX that's designed for unbuilt features is guesswork, and acceptance criteria written without the context of adjacent features miss the real edge cases.

**What to specify upfront (at CP2):**
- Architecture — structural decisions affect everything; they must be made before building starts
- Epics — high-level capabilities with rough size and epic-level acceptance; enough to sequence the build
- Non-functional requirements — these shape the architecture, so they're upfront
- Key user flows and IA — the Architect needs these for structural decisions

**What to specify just-in-time (before each epic starts):**
- Detailed user stories with full acceptance criteria
- Detailed UX flows for specific screens
- Edge cases and error states — best written when adjacent features are already built
- Component-level architecture decisions — made when the component is about to be built

**The rule:** Stories for an epic are elaborated before that epic begins — not months ahead, not during build. Each epic's stories are written when the team knows the most about the surrounding system and the real constraints of the architecture in practice.

This keeps specs grounded in reality. What was learned building previous epics directly informs how the next epic's stories are written.

---

## Structure: Milestones and Epics

The build phase is organised into two levels:

**Milestones** — feature-complete increments of the product. A milestone ends with something demonstrably working that didn't exist before. Milestones are defined at CP2 and tracked in the implementation plan. If CP3 is enabled, each milestone has a review before the next begins.

**Epics** — the working cadence within a milestone. An epic is a self-contained feature area, executed story by story, reviewed before the next epic begins. Epics keep work visible, surface problems early, and give the Engineering Lead a feedback loop for re-planning.

```
Milestone 1
  ├── Epic 1  →  Epic Review
  ├── Epic 2  →  Epic Review
  └── Epic 3  →  Epic Review → Milestone Review (CP3 if enabled)
Milestone 2
  ├── Epic 4  →  Epic Review
  └── ...
```

---

## Epic Structure

### Story Elaboration (before each epic starts)
Led by the Product Manager and UX Designer, with Engineering Lead review.

1. Take the next epic from the prioritised backlog
2. Elaborate it into detailed, ready user stories — acceptance criteria, edge cases, error states
3. Produce detailed UX flows for each story's screens
4. Engineering Lead reviews every story against the **Definition of Ready**. Stories that are not ready go back for more elaboration before build starts.
5. Human approves the elaborated story set before build begins on the epic

### Epic Execution
The build loop per story: QA writes tests (failing) → Developer implements → QA validates → Engineering Lead reviews PR → human merges. Repeat for each story in the epic.

The Engineering Lead tracks progress against the epic. If a story is blocked or significantly more complex than anticipated, it is surfaced immediately — not discovered at the end.

### Epic Review
Runs when all stories in the epic are complete. Led by the Engineering Lead.

1. What was built vs. what was planned — honest accounting
2. Whether the epic met its acceptance criteria
3. Any new information that changes backlog priority or shapes the next epic's stories
4. Carry-overs and why

Epic reviews are not retrospectives. They are fast, factual assessments of the epic outcome. The retrospective is a separate, deeper process run at milestone or project end.

---

## Ceremonies: What Applies, What Doesn't

| Ceremony | Applies? | How |
|----------|----------|-----|
| Story elaboration | Yes | PM + UX Designer elaborate next epic's stories before that epic begins; Engineering Lead reviews for readiness |
| Epic review | Yes | Engineering Lead reviews completed vs. planned, feeds learnings to PM for next elaboration |
| Milestone review | Yes | Maps to CP3 — optional, enabled per project |
| Retrospective | Yes | `/retrospective` command — run at milestone or project end |
| Sprint planning / sprint review | No | Superseded by epic structure |
| Daily standup | No | Agents don't have time between sessions — status is always visible in the implementation plan |

---

## Backlog Management

The backlog is the single source of truth for what gets built. It is owned by the Product Manager and prioritised by value and dependency.

**Principles:**
- The backlog is always prioritised. The top epic is always the most important thing to build next.
- Stories enter an epic only when they meet the Definition of Ready
- Stories are never added to a running epic without Engineering Lead sign-off. New work goes to the backlog and is prioritised for a future epic.
- The MVP line in the backlog is fixed unless a formal scope-change is approved

---

## Throughput

Throughput is the number of stories (or epics) completed per unit of time. The Engineering Lead tracks this from the first epic.

**Purpose:** Throughput is used to plan, not to judge. It tells the Engineering Lead how much fits in an epic. It tells the human whether the current plan is achievable. It is never used to pressure the team to go faster.

**How it's tracked:** In the implementation plan actuals table — epics completed, stories committed, stories completed.

---

## Agile and Spec-Driven Development Together

These principles reinforce each other:

- Agile says: deliver incrementally, respond to change
- Spec-driven says: know what you're building before you build it

They are not in conflict. Agile does not mean "figure it out as you go." It means "deliver in iterations, and be honest when the plan changes." Spec-driven ensures each iteration is well-defined before it begins. The scope-change process is how change is handled without abandoning the spec discipline.

The result: each epic starts with a clear, complete set of stories. The team executes with confidence. When reality diverges from the plan, it is surfaced through process — not discovered after the fact.
