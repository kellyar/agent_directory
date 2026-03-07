# Scope Change Request

**Project:** [Project Name]
**Date:** [YYYY-MM-DD]
**Raised by:** [Human / Agent / Team Lead]
**Status:** Pending Assessment | Approved | Rejected

---

## The Change
[What is being proposed? State it plainly — what is being added, removed, or modified?]

## Why
[What drove this change? New information, user feedback, technical constraint, change in direction?]

## What This Affects

**Tier assessment:**

| Tier | Description | This change? |
|------|-------------|-------------|
| **1 — Small** | New story or modified AC within approved architecture and scope | |
| **2 — Medium** | New feature that fits within the architecture but wasn't in approved scope | |
| **3 — Major** | Changes that affect architecture, solution direction, or approved scope boundary | |

**Tier:** 1 | 2 | 3

---

## Impact Assessment

**Documents affected:**
- [ ] `discovery/checkpoint-1.md` — problem or solution direction changes
- [ ] `design/prd.md` — requirements change
- [ ] `design/stories/` — stories added, removed, or modified
- [ ] `design/architecture.md` — architecture affected
- [ ] `design/checkpoint-2.md` — CP2 re-approval required
- [ ] `build/implementation-plan.md` — build plan changes

**What needs to be re-run:**

*Tier 1:*
- PM updates `design/prd.md` and affected stories
- Engineering Lead updates `build/implementation-plan.md`
- Log decision in `decisions.md`
- No checkpoint re-approval required

*Tier 2:*
- PM updates `design/prd.md` and stories
- Systems Architect reviews architecture impact
- CP2 re-approval required for affected sections
- Engineering Lead updates implementation plan after approval

*Tier 3:*
- Return to the appropriate phase for rework
- Full checkpoint re-approval required before proceeding

**Estimated impact on current milestone:**
[What gets delayed, de-scoped, or re-ordered as a result?]

---

## Decision

**Approved / Rejected / Deferred**

**Notes:**
[Rationale, conditions, or what to revisit later]

**Logged in decisions.md:** Yes / No
