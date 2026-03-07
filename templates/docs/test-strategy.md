# Test Strategy

**Created by:** QA Engineer
**Project:** [Project Name]
**Date:** [YYYY-MM-DD]

This document is produced before development starts — not after. QA is an active participant from day one, not a gatekeeper at the end.

---

## Approach
[How quality is assured on this project. What philosophy guides testing here — e.g., risk-based, coverage-driven, exploratory-first. Be specific to this project's context.]

---

## Test Types

| Type | Scope | When | Tooling | Owner |
|------|-------|------|---------|-------|
| Unit | Individual functions / components | Every task | | Developer + QA |
| Integration | Component interactions, API contracts | Every milestone | | QA |
| End-to-end | Full user flows | Every milestone | | QA |
| Manual exploratory | Edge cases, UX, adversarial | Every milestone | — | QA |
| Performance | Response times, load | [milestone or pre-launch] | | QA |
| Security | Auth, input validation, data exposure | [milestone or pre-launch] | | QA |

---

## Coverage Goals
What "enough" means for this project. Be specific.

- **Critical paths:** [Every acceptance criterion for MVP stories must have a test case]
- **Edge cases:** [Minimum N edge cases per story]
- **Error states:** [All specified error states must be tested]
- **Coverage target:** [% if applicable — or "no hard target; focus on risk-based coverage"]

---

## Test Environment

- **Test environment:** [Where tests run — local, CI, staging]
- **Test data approach:** [How test data is created and managed — fixtures, factories, seeded DB, etc.]
- **External dependencies:** [How they're handled — prefer real services (sandbox/test accounts) over mocks. If mocking, document why and what integration risk is accepted.]
- **CI integration:** [Which tests run on every PR, which run on merge, which are manual]

### Integration-First Stance
Prefer tests that run against real services, databases, and infrastructure over mocked equivalents. Mocks hide integration failures — the very failures most likely to surface in production. Use mocks only when real services are: unavailable in CI, prohibitively slow (>10s added to CI), or incur per-call costs. Document every mock as a known gap in coverage.

---

## Tooling

| Tool | Purpose | Version | Notes |
|------|---------|---------|-------|
| | Unit testing | | |
| | Integration / E2E | | |
| | Coverage reporting | | |
| | Bug tracking | | |

---

## Risk-Based Priorities
Where to focus testing effort most. Ordered by risk.

1. [Area / feature] — [Why it's high risk: complex logic, external dependency, security surface, etc.]
2.
3.

---

## What QA Will Not Cover
Explicit exclusions. Prevents misaligned expectations at sign-off time.

-

---

## Sign-off Criteria
A milestone receives QA sign-off when all of the following are true:

- [ ] All acceptance criteria for milestone stories have a corresponding test case
- [ ] All test cases have been executed and results recorded
- [ ] No blocking issues remain open
- [ ] All critical and high-severity issues from exploratory testing are resolved or formally accepted
- [ ] [Any project-specific criteria]
