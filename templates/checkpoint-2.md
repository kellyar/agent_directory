# Checkpoint 2: Build Approval

**Project:** [Project Name]
**Date:** [YYYY-MM-DD]
**Prepared by:** Systems Architect + Product Manager + Orchestrator
**Status:** Pending Approval | Approved | Rejected | Approved with Changes

CP2 approves structural architecture and epic-level scope. Detailed user stories are elaborated just-in-time during backlog refinement, one sprint before they are built.

---

## Architecture Summary
*Structural decisions only — these affect everything and must be locked before building starts. Full document in `design/architecture.md`.*

**Component boundaries:**
[How the system is divided and why]

**Data model:**
[Core entities and their relationships — schema decisions we're committing to]

**Tech Stack**
| Layer | Choice | Rationale |
|-------|--------|-----------|
| Frontend | | |
| Backend | | |
| Database | | |
| Infrastructure | | |
| Key Services/APIs | | |

**Auth approach:**
[How authentication and authorisation work]

**What's deferred to just-in-time:** Component-level implementation decisions are made when each component is built, not here.

## Key Tradeoffs Made
*The most significant structural decisions and why alternatives were rejected. Full log in `design/tradeoff-log.md`.*

## Risk Register (Top Risks)
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| | Low/Med/High | Low/Med/High | |

*Full register in `design/risk-register.md`.*

---

## Epic Scope (MVP)
*Approved at epic level. Stories are elaborated during backlog refinement — one sprint before each epic is built.*

**MVP epics (must ship):**
| Epic | ID | Rough Size | Key Capability |
|------|----|------------|----------------|
| | EP-XXX | S/M/L | |

**Explicitly deferred to V2:**
| Epic | Reason |
|------|--------|
| | |

*Full epic details in `design/epics/`.*

## Non-Functional Requirements Summary
*Full PRD in `design/prd.md` Section 7.*

| Requirement | Target |
|-------------|--------|
| Response time (p95) | |
| Availability | |
| Security standard | |

## UX Summary
*IA, navigation model, key flows, and screen inventory approved here. Detailed screen specs are produced per sprint during build. Full flows in `design/ux-flows.md`.*

**Navigation model:** [summary]
**Key flows approved:** [list]
**Screen count:** [number from screen inventory]

## Milestone Plan Outline
*High-level milestone sequence. Full implementation plan produced by Engineering Lead at build start.*

| # | Milestone | Epics | Goal |
|---|-----------|-------|------|
| 1 | Foundation | | |
| 2 | | | |

---

## Decision

**Approved / Rejected / Approved with Changes**

*Notes from approver:*

**If changes required:**
*What needs to change before proceeding:*

**Gate:** Build Team is not briefed until this checkpoint is approved. This is the most critical checkpoint — structural decisions made here are expensive to reverse.
