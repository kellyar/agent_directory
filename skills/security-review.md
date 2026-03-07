# Skill: Security Review

## Purpose
A structured adversarial review applied to code and architecture to surface security vulnerabilities before they ship. Used by the QA Engineer during task validation and by the Engineering Lead during code review. Not a replacement for a dedicated security audit on high-risk projects — a baseline that catches the most common and costly issues.

## When to Apply
- Engineering Lead: during code review of any task touching auth, data handling, or external input
- QA Engineer: as part of test case design for any feature with a security surface
- Systems Architect: when reviewing architecture for integration points and data flows
- Any agent: when a feature touches user data, authentication, payments, or external APIs

---

## Review Areas

### 1. Authentication & Authorisation
- Is every protected route/endpoint actually enforcing auth checks?
- Are authorisation checks at the right level — not just UI, but API and data layer?
- Is there any way to escalate privileges or access another user's data by manipulating IDs or parameters? (Insecure Direct Object Reference)
- Are session tokens invalidated on logout and expiry?
- Are failed login attempts rate-limited?

### 2. Input Validation & Injection
- Is all user input validated and sanitised before use?
- Are database queries using parameterised statements or an ORM — never string concatenation? (SQL injection)
- Is any user input rendered in the UI without escaping? (XSS)
- Are file uploads restricted by type, size, and storage location?
- Is any user input passed to system commands, shell, or eval? (Command injection)

### 3. Sensitive Data Handling
- Are passwords hashed with a strong algorithm (bcrypt, argon2)? Never stored in plain text.
- Are API keys, secrets, and credentials in environment variables — never hardcoded or committed?
- Is sensitive data (PII, payment info, health data) encrypted at rest and in transit?
- Are sensitive fields excluded from logs?
- Is the minimum data collected and retained for the minimum time needed?

### 4. Dependencies
- Do any new dependencies have known CVEs? (Check with `npm audit`, `pip-audit`, `bundler-audit`, etc.)
- Are dependency versions pinned to avoid supply chain issues?
- Are dependencies from trusted, maintained sources?

### 5. API & Integration Security
- Are all external API calls made server-side, not client-side, to avoid exposing keys?
- Are webhook payloads validated for authenticity?
- Is rate limiting applied to public-facing endpoints?
- Are CORS policies appropriately restrictive?

### 6. Error Handling & Information Disclosure
- Do error messages expose stack traces, internal paths, or system details to users?
- Are errors logged server-side with enough detail to debug — but not exposing sensitive data in logs?
- Do API responses expose more data than the client needs? (Over-fetching)

### 7. Infrastructure & Configuration
- Are environment-specific secrets managed separately per environment?
- Is the principle of least privilege applied to service accounts and database users?
- Are admin interfaces not publicly exposed?
- Are security headers set? (Content-Security-Policy, X-Frame-Options, etc.)

---

## Output
For each area reviewed, produce one of:
- **Pass** — no issues found
- **Finding (Blocking)** — must be resolved before sign-off. Describe: what, where, why it's a risk, how to fix.
- **Finding (Non-blocking)** — should be addressed but doesn't block. Describe and recommend.
- **N/A** — area not applicable to this task/feature, with brief reason

## Notes
- Security review is not a checkbox — think like an attacker. What would you do if you wanted to access data you shouldn't, bypass a restriction, or crash the system?
- If a finding is outside the scope of the current task to fix, escalate to Engineering Lead rather than leaving it undocumented.
- For projects handling payments, health data, or regulated PII, flag that a dedicated security audit beyond this skill is warranted.
