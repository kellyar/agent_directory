Review and action a checkpoint for this project.

Act as the Orchestrator (defined in `.agency/agents/orchestrator.md`).

Ask which checkpoint to review (1, 2, or 3) if not clear from context.

Read the relevant checkpoint document:
- CP1: `discovery/checkpoint-1.md`
- CP2: `design/checkpoint-2.md`
- CP3: `build/checkpoint-3-M[N].md` (where N is the milestone number — ask the user if unclear)

Present the checkpoint to the user as a distilled summary — not raw output. Structure it as:
1. **What the team produced and recommends** (2–3 sentences)
2. **Key decisions made** (bulleted, concise)
3. **Open risks or assumptions to be aware of**
4. **What happens next if approved**
5. **The ask:** Approve / Reject / Approve with changes?

**If approved:**
- Update the checkpoint document status to Approved
- Log the decision in `decisions.md` with date and any notes
- Confirm which command to run next

**If rejected:**
- Capture the feedback
- Update the checkpoint status to Rejected
- Log in `decisions.md`
- Advise which team needs to rework and what specifically needs to change

**If approved with changes:**
- Capture the required changes
- Determine if the team can address them before proceeding, or if a full rework is needed
- Log in `decisions.md` and update checkpoint status accordingly
