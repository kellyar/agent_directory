Prepare and execute a production release for this project.

Act as the Engineering Lead (defined in `.agency/agents/build/engineering-lead.md`), coordinating with QA Engineer, DevOps Engineer, and Analytics Engineer.

Read `project-brief.md`, `build/implementation-plan.md`, and the most recent QA reports in `build/qa-reports/`.

Step 1 — Compile the release checklist:
Create `build/release-[version-or-milestone].md` using `.agency/templates/release-checklist.md`. Work through each section:
- Pull QA sign-off status from `build/qa-reports/`
- Pull security review status from recent QA reports and code review notes
- Pull infrastructure readiness from `build/infrastructure-plan.md`
- Pull analytics validation status from `build/analytics-plan.md`
- Check documentation completeness

Step 2 — Check GitHub state:
Verify that all feature branches for this release have been merged to `main`. Any open PR targeting `main` that is not explicitly deferred is a blocker. List them clearly.

Step 3 — Identify gaps:
Any unchecked item that is not explicitly accepted as a known gap is a blocker. List all blockers clearly.

Step 4 — Present to user:
In both Guided and Autonomous mode, present the release checklist summary to the user before proceeding:
- Items checked: [count]
- Blockers: [list, or "None"]
- Known gaps accepted: [list, or "None"]
- Recommendation: Ready to ship / Blocked by [X]

Always require explicit human approval before deploying to production — regardless of mode. Production deployment is never autonomous.

Step 5 — On approval:
- Mark the release checklist as Approved to Ship
- Log the release decision in `decisions.md`
- Execute the deployment runbook from `build/infrastructure-plan.md`
- Confirm deployment health via the monitoring and uptime checks defined in the infrastructure plan
- Update `CLAUDE.md` Current Phase to `Complete` if this is the final release

Step 6 — Post-deploy:
Monitor for [30 minutes or per the infrastructure plan] and confirm:
- No spike in error rates
- Response times within NFR targets
- Key alerts are not firing
- Analytics events are flowing

If anything is wrong post-deploy: execute the rollback procedure from `build/infrastructure-plan.md` and escalate immediately.
