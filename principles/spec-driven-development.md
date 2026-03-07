# Principle: Spec-Driven Development

## What It Is

Spec-driven development means the specification is written and approved *before* code is written. The spec is the source of truth. Code is the implementation of the spec — not the other way around.

This is the foundational principle of how this organisation builds software. Every agent that produces output produces a spec. Every agent that builds something builds to a spec.

---

## The Spec Hierarchy

Each layer of spec feeds the next. No layer begins until the previous is approved.

```
Problem Statement + Solution Direction   (Product Strategist → CP1)
        ↓
PRD + User Stories + Acceptance Criteria (Product Manager → CP2)
        ↓
Architecture + UX Flows                  (Systems Architect + UX Designer → CP2)
        ↓
Task Definition + Definition of Ready    (Engineering Lead → sprint planning)
        ↓
Working Code                             (Developer)
        ↓
Test Cases + QA Validation               (QA Engineer)
```

Each level is a progressively more specific specification of the same thing. The PRD specifies what the system does. The architecture specifies how it does it. The task definition specifies exactly what the Developer builds. The test cases specify what "done" looks like from the outside.

---

## The Golden Rules

**1. Spec first. Always.**
No code is written without a spec. If a Developer starts a task and there is no spec — or the spec is incomplete — they stop and escalate. They do not fill in the gaps themselves.

**2. The spec is the source of truth.**
If code and spec conflict, the spec wins. The Developer does not adjust the spec to match what they built. If the spec needs to change, it goes through the appropriate agent (PM for requirements, Architect for technical decisions) and is updated first. Then the code changes to match.

**3. Spec changes go through process.**
Changing a spec mid-build is a scope change. Small changes go through the Engineering Lead. Anything that affects acceptance criteria goes through the PM. Anything that affects architecture goes through the Architect. Nothing is changed informally.

**4. Ambiguity is escalated, not assumed.**
If a spec is ambiguous, the Developer escalates to the Engineering Lead, who escalates to the appropriate author. Assumptions made by Developers to fill spec gaps are the most common source of rework in software projects.

**5. Tests are written before code, against the spec.**
QA writes test cases against acceptance criteria before the Developer starts implementation. Tests are confirmed failing (because nothing is built yet) before coding begins. This is the proof that tests actually validate the spec — not that they were retrofitted after the fact.

**6. Uncertainty is marked, not hidden.**
When writing a spec, use `[NEEDS CLARIFICATION]` to flag any area of genuine uncertainty rather than filling it in with a plausible guess. A spec with visible uncertainty is better than a spec that looks complete but contains assumptions. Every `[NEEDS CLARIFICATION]` marker must be resolved before the spec can be used — it is a gate, not a note.

**7. Production reality feeds the spec.**
When a feature is live, what users actually do — and what breaks — is new information. Incidents, usage patterns, and analytics that contradict spec assumptions are fed back through the retrospective process. Specs are updated to reflect what was learned. The spec never becomes a historical artifact that diverges from how the system actually works.

---

## What This Prevents

| Anti-pattern | How spec-driven prevents it |
|-------------|----------------------------|
| Developer makes a product decision mid-task | Definition of Ready gates the task until spec is complete |
| "I'll document it later" | No code written without spec — documentation is the prerequisite, not the follow-up |
| Spec drift | Spec is the source of truth; code never drives spec changes |
| Rework from ambiguity | Ambiguity escalated at spec time using `[NEEDS CLARIFICATION]` markers, not discovered at build time |
| Testing what was built instead of what was required | Test cases written from acceptance criteria *before* dev starts, confirmed failing |
| Specs that look complete but contain hidden assumptions | `[NEEDS CLARIFICATION]` markers make uncertainty explicit and block progress until resolved |
| Specs that diverge from reality after launch | Production feedback loop via retrospective keeps specs grounded in how the system actually works |

---

## How It Connects to Other Principles and Processes

- **Definition of Ready** — the task-level gate that enforces spec completeness before development starts. `[NEEDS CLARIFICATION]` markers in a spec are blockers here.
- **Scope Change Process** — the formal path for changing a spec mid-build
- **QA writing tests before dev** — a direct application of spec-driven: the acceptance spec drives tests, tests are confirmed failing, then the Developer starts
- **Checkpoint 2** — the most important gate in the process, because it approves the specs that the entire build phase executes against
- **Retrospective (production feedback loop)** — specs are living documents. Production reality is the final test of whether a spec was right. Learnings feed back into updated specs and agency improvements.

---

## Agent Responsibilities Under This Principle

| Agent | Spec they own | Responsibility |
|-------|--------------|----------------|
| Product Manager | PRD, User Stories, Acceptance Criteria | Write specs completely before build. Use `[NEEDS CLARIFICATION]` for anything uncertain — resolve before handing off. Update specs via scope change process, never informally. |
| Systems Architect | Architecture Doc, Tradeoff Log | Technical decisions are documented in the spec before implementation. |
| UX Designer | UX Flows, Screen Inventory | All states and flows specified before development. No undefined states. |
| Engineering Lead | Task Definitions, Code Standards | Every task fully specced before assigned. Definition of Ready enforced. `[NEEDS CLARIFICATION]` markers are blockers, not suggestions. |
| Developer | — | Execute the spec. Escalate ambiguity immediately. Never write code without a complete spec. If the spec contains a `[NEEDS CLARIFICATION]` marker, the task is not ready. |
| QA Engineer | Test Cases | Write tests from acceptance criteria *before* development starts. Confirm tests fail before handing to Developer. Test the spec, not the implementation. |
