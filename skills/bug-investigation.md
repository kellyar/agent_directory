# Bug Investigation

**Purpose:** Structured process for diagnosing an unknown bug in an existing codebase — from symptom to confirmed root cause with a fix recommendation.

**When to Apply:**
- A bug has been reported but root cause is unknown
- Tests are failing and the failure isn't obviously linked to recent changes
- A feature behaves incorrectly in production but passed QA
- Engineering Lead or QA Engineer needs to understand *why* something is broken before assigning a fix

---

## Process

Work through each phase in order. Do not skip to hypotheses before reading the code.

### Phase 1 — Establish the symptom
Before touching any code, get precise about what is actually wrong:
- What is the observed behaviour?
- What is the expected behaviour?
- Under what conditions does it occur? (always / intermittently / specific input / specific environment)
- What is the first failing signal? (error message, wrong output, crash, silent wrong result)
- When did it start? (specific commit, deploy, or unknown)

Write these down explicitly. Vague symptoms produce wrong hypotheses.

### Phase 2 — Gather evidence
Collect everything available before reading code:
- Error messages and stack traces (full text, not paraphrased)
- Relevant logs — identify the exact log lines surrounding the failure
- Reproduction steps — the minimal sequence that reliably triggers the bug
- Recent changes — git log for the affected area since the bug appeared
- Environment details — does it occur in all environments or specific ones?

If you cannot reproduce the bug, say so. Investigation without reproduction is speculation.

### Phase 3 — Read the relevant code
Do not guess at root cause. Read the code first.

Starting from the entry point (the first place the user action or system event enters the code):
1. Follow the execution path step by step to the failure point
2. Read each function or method in full — do not skim
3. Note every assumption the code makes about its inputs, state, and dependencies
4. Identify all branch conditions — which path does execution actually take given the bug conditions?
5. Check data transformations — where does the shape or value of data change?

Read adjacent code too: callers, callees, shared state, configuration. Bugs frequently live one level away from where the symptom surfaces.

### Phase 4 — Form hypotheses
Based on what you read, list candidate root causes. For each:
- **Hypothesis:** what specifically is wrong (be precise — not "null pointer issue", but "function X returns null when Y is empty but caller at line Z assumes non-null")
- **Evidence for:** what in the code supports this
- **Evidence against:** what would disprove it
- **Confidence:** High / Medium / Low

Aim for 2–4 hypotheses. If you have more, the symptom description is likely too broad.

### Phase 5 — Validate and eliminate
For each hypothesis, determine what would confirm or rule it out:
- Trace the specific execution path with the bug conditions in mind
- Check whether the assumption the hypothesis relies on is actually violated
- Cross-reference with stack traces, logs, or reproduction steps
- If possible, identify the exact line where correct behaviour diverges from actual behaviour

Eliminate hypotheses with evidence. A hypothesis is only confirmed when all others are ruled out *and* the confirmed hypothesis fully explains the observed symptom.

### Phase 6 — Produce the Bug Report

**Bug Report format:**

```
## Bug Report

### Symptom
[What is observed vs. what is expected — one short paragraph]

### Reproduction
[Minimal steps to trigger the bug]

### Root Cause
[Precise description of what is wrong and why — specific file, function, line number where applicable]

### Evidence
[The specific code, log lines, or trace that confirms the root cause]

### Affected Code
[List of files and line numbers directly involved]

### Fix Recommendation
[What needs to change to resolve the root cause — not implementation detail, but the logical change required]

### Confidence
[High / Medium — with brief note if Medium]

### Out of Scope
[Related issues noticed during investigation that are not the root cause of this bug — log separately for backlog]
```

---

## Key Notes

- **Read before hypothesising.** The most common investigation failure is forming a root cause guess before reading the code path. Guesses are not hypotheses.
- **Symptoms lie.** The line that throws the error is rarely where the bug was introduced. Trace upstream.
- **One root cause per report.** If investigation reveals multiple independent bugs, produce separate reports.
- **Confidence matters.** A Medium confidence finding should say so explicitly — a fix applied to the wrong root cause wastes time and can introduce new bugs.
- **Do not fix during investigation.** The investigation produces a report and a fix recommendation. The Developer implements the fix against the spec. Keep the phases separate.
- If investigation reveals the bug requires an architectural or product decision to fix, escalate to Engineering Lead before producing the report.
