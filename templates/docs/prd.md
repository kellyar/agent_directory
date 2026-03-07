# Product Requirements Document

**Created by:** Product Manager
**Project:** [Project Name]
**Version:** 1.0
**Date:** [YYYY-MM-DD]
**Status:** Draft | Approved

Reference: [Atlassian PRD guidance](https://www.atlassian.com/agile/product-management/requirements)

---

## 1. Overview
[2–3 sentences. What is this product, who is it for, and what problem does it solve? Reference the approved Problem Statement from CP1.]

---

## 2. Business Goals
*Why does this product exist? How does it support the organisation's larger objectives? This section is written for stakeholders and leadership — not developers.*

### Organisational Alignment
[How does this project connect to a broader company goal, strategy, or OKR?]

### Business Outcomes
What the business needs to achieve — not what the system does, but why it matters.

| Outcome | Why It Matters | Owner |
|---------|---------------|-------|
| | | |

### Success Metrics
How we know the product is working. Separate leading indicators (early signals) from lagging indicators (confirmed results).

| Metric | Type | Baseline | Target | Timeframe |
|--------|------|----------|--------|-----------|
| | Leading / Lagging | | | |

---

## 3. Users

| Persona | Priority | Primary Job To Be Done | Reference |
|---------|----------|----------------------|-----------|
| [Name] | Primary | | `discovery/user-personas.md` |
| [Name] | Secondary | | |

---

## 4. Assumptions & Constraints

### Assumptions
What we're treating as true without full validation. Each is a risk if wrong.

| Assumption | Confidence | Impact if Wrong |
|------------|------------|-----------------|
| | Low / Med / High | |

### Constraints
Boundaries the product must operate within — technical, legal, business, or timeline.

| Constraint | Type | Implication |
|------------|------|-------------|
| | Technical / Legal / Business / Timeline | |

---

## 5. Scope

### MVP — Must Ship
Features required for the initial release to deliver core value. Each feature here passed the Scope Pressure Test.

| Feature | Description |
|---------|-------------|
| | |

### V2 — Explicitly Deferred
Valuable but not required for MVP. Documenting these prevents scope creep.

| Feature | Reason Deferred |
|---------|----------------|
| | |

### Out of Scope
Things that will not be built as part of this product, ever or for now.

-

---

## 6. Functional Requirements
*What the system must do. Written for developers and QA. Each requirement is traceable to a user story and a business goal.*

### [Feature Name]

**User story:** As a [persona], I want to [action] so that [outcome].

**Description:**
[What this feature does. Specific enough that a developer has no product decisions to make.]

**Acceptance criteria:**
- [ ] [Specific, testable condition — pass/fail, not vague]
- [ ] [Specific, testable condition]

**Edge cases:**
- [What happens when input is empty / null / at max length / invalid]
- [What happens when the user has no existing data]

**Error states:**
- [What the user sees when X fails — specific message or behaviour]
- [Validation error handling]

---

[Repeat for each feature]

---

## 7. Non-Functional Requirements
*How the system must perform. Written for developers and the Systems Architect. These are system-wide qualities, not feature-specific behaviours.*

### Performance
| Requirement | Target | Measurement Method |
|-------------|--------|-------------------|
| Page / API response time (p95) | | |
| Time to interactive (initial load) | | |
| Max concurrent users at launch | | |

### Reliability & Availability
| Requirement | Target |
|-------------|--------|
| Uptime SLA | |
| Recovery time objective (RTO) | |
| Recovery point objective (RPO) | |

### Security
- **Authentication:** [mechanism and requirements]
- **Authorisation:** [how permissions are enforced]
- **Data encryption:** [at rest / in transit requirements]
- **Compliance:** [GDPR, SOC2, HIPAA, etc. — or "None identified"]
- **Sensitive data handling:** [what's sensitive and how it's protected]

### Scalability
[How the system must behave as load grows. What's the expected growth trajectory and what must the architecture support?]

### Accessibility
- **Standard:** [e.g., WCAG 2.1 AA — or "Not required for this release"]
- **Key requirements:** [screen reader support, keyboard navigation, colour contrast, etc.]

### Compatibility
| Target | Requirement |
|--------|-------------|
| Browsers | |
| Mobile OS | |
| Screen sizes | |
| Internationalisation | |

---

## 8. Business Rules
*Domain-level rules that govern how the product behaves — independent of UI or technical implementation. These are non-negotiable constraints on the business logic.*

- [e.g., "A user may only have one active subscription at a time"]
- [e.g., "Prices displayed to EU users must include VAT"]
- [e.g., "Audit logs must be retained for a minimum of 7 years"]
- [e.g., "A [entity] cannot be deleted if it has active [related entities]"]

---

## 9. Stakeholders

| Name / Role | Interest | Involvement |
|-------------|----------|-------------|
| | [What they care about] | Approver / Consulted / Informed |

---

## 10. Open Questions
Requirements that need further clarity before or during development. Each has an owner and a target resolution date.

| Question | Context | Owner | Due |
|----------|---------|-------|-----|
| | | | |
