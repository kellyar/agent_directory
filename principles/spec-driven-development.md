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

**5. Tests are written against the spec, not the implementation.**
QA writes test cases against acceptance criteria before code is written. Tests validate that the implementation satisfies the spec — not that the implementation is internally consistent.

---

## What This Prevents

| Anti-pattern | How spec-driven prevents it |
|-------------|----------------------------|
| Developer makes a product decision mid-task | Definition of Ready gates the task until spec is complete |
| "I'll document it later" | No code written without spec — documentation is the prerequisite, not the follow-up |
| Spec drift | Spec is the source of truth; code never drives spec changes |
| Rework from ambiguity | Ambiguity escalated at spec time, not discovered at build time |
| Testing what was built instead of what was required | Test cases written from acceptance criteria before dev starts |

---

## How It Connects to Other Principles and Processes

- **Definition of Ready** — the task-level gate that enforces spec completeness before development starts
- **Scope Change Process** — the formal path for changing a spec mid-build
- **QA writing tests before dev** — a direct application of spec-driven: the acceptance spec drives tests, not the code
- **Checkpoint 2** — the most important gate in the process, because it approves the specs that the entire build phase executes against

---

## Agent Responsibilities Under This Principle

| Agent | Spec they own | Responsibility |
|-------|--------------|----------------|
| Product Manager | PRD, User Stories, Acceptance Criteria | Write specs completely before build. Update specs via scope change process, never informally. |
| Systems Architect | Architecture Doc, Tradeoff Log | Technical decisions are documented in the spec before implementation. |
| UX Designer | UX Flows, Screen Inventory | All states and flows specified before development. No undefined states. |
| Engineering Lead | Task Definitions, Code Standards | Every task fully specced before assigned. Definition of Ready enforced. |
| Developer | — | Execute the spec. Escalate ambiguity. Never write code without a complete spec. |
| QA Engineer | Test Cases | Write tests from acceptance criteria before development. Test the spec, not the code. |
