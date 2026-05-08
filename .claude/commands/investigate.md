Investigate a bug in the codebase and produce a root cause diagnosis.

Act as the Engineering Lead (defined in `.agency/agents/build/engineering-lead.md`) conducting a structured bug investigation using `skills/bug-investigation.md`. Bring in the QA Engineer sub-agent for reproduction and validation where needed.

---

## What to provide

If a bug description was passed with this command, use it. If not, ask the user:

1. **What is the observed behaviour?** (be specific — error message, wrong output, crash)
2. **What is the expected behaviour?**
3. **Can you reproduce it?** If yes, what are the steps?
4. **When did it start?** (specific commit, deploy, or unknown)
5. **Which area of the codebase is affected?** (if known — otherwise say unknown)

Do not proceed without at least items 1 and 2.

---

## Process

Follow `skills/bug-investigation.md` exactly. The phases are:

**Phase 1 — Establish the symptom**
Confirm the symptom is precisely defined. If the description is vague, ask clarifying questions before proceeding.

**Phase 2 — Gather evidence**
- Run relevant tests to confirm the failure:
  ```bash
  # Run the specific failing test if known
  # Run the full suite to check for related failures
  ```
- Check git log for recent changes in the affected area:
  ```bash
  git log --oneline -20 -- [affected path]
  ```
- Check for error logs or relevant output.

**Phase 3 — Read the relevant code**
Starting from the entry point, follow the execution path to the failure point. Read each step in full. Do not skim. Use file reading tools — do not assume you know what the code does.

Identify:
- The exact execution path under the bug conditions
- Every assumption the code makes about inputs, state, and dependencies
- Where the actual behaviour first diverges from expected

**Phase 4 — Form hypotheses**
List 2–4 candidate root causes with evidence for/against each and a confidence rating.

**Phase 5 — Validate and eliminate**
Trace each hypothesis against the actual code. Eliminate with evidence. Confirm the single root cause that fully explains the symptom.

**Phase 6 — Produce the Bug Report**
Use the Bug Report format from `skills/bug-investigation.md`. Include:
- Symptom
- Reproduction steps
- Root cause (specific file and line)
- Evidence
- Affected code (files and lines)
- Fix recommendation
- Confidence
- Out of scope issues noted

---

## After the report

Present the Bug Report to the user.

If the fix is straightforward and within the approved architecture, ask: *"Do you want me to open a fix branch and implement this now?"*

If the fix requires an architectural or product decision, surface it as an options frame using `skills/options-framing.md` before proposing any implementation.

Do not implement the fix without user confirmation.
