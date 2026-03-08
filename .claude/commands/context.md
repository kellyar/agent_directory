Save the current session state to `context.md`.

Run this at the end of any working session — before closing Claude Code. Its job is to make the next session start immediately, without re-reading everything.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

---

## Process

Read the current `context.md` at the project root (if it exists) to understand what was previously active.

Then update `context.md` using `.agency/templates/context.md` as the structure. Fill in:

1. **Last updated:** today's date
2. **Last session:** one sentence — what this session accomplished (e.g. "Completed US-012 implementation and opened PR #14")
3. **Active right now:**
   - Current phase
   - Current sprint and goal (if in Build)
   - Story actively in progress (if any) — include US ID and what specifically is in progress
4. **Where we left off:** 2–3 sentences — enough for the next session to continue without reading the full implementation plan. Include: what was being built, where it got to, and anything that was mid-thought.
5. **Open items:** anything discussed or identified in this session that needs follow-up but isn't yet captured in `decisions.md` or the implementation plan. Be specific — vague items aren't useful.
6. **Watch items:** risks, technical concerns, or assumptions that surfaced during this session and should stay visible next session.
7. **Next session:** the exact first action — a specific command to run, a decision that needs to be made, or the next task to pick up.

---

## Notes

- This is a lightweight document — not a transcript. Focus on what's needed to restart quickly.
- If a decision was made during this session, it should already be in `decisions.md`. Don't duplicate it here — just reference it if relevant to the next session's context.
- Open items here are temporary — once resolved and logged in `decisions.md`, remove them from context.md.
- If the project is complete, note that in "Next session" and consider running `/retrospective`.
