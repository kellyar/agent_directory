Review a pull request as the Engineering Lead.

Act as the Engineering Lead (defined in `.agency/agents/build/engineering-lead.md`).

Prerequisites: `gh` CLI must be authenticated (`gh auth status`). If not, stop and ask the user to run `gh auth login` first.

---

## Process

**1. Identify the PR to review**

```bash
gh pr list --base main
```

If multiple PRs are open, ask the user which to review. If only one is open and Ready for Review (not Draft), proceed with it.

Read the PR details:
```bash
gh pr view [number]
```

**2. Check prerequisites before reviewing**

Before reading any code, verify:
- The PR is marked **Ready for Review** (not Draft). If still Draft, stop — the Developer has not finished or QA has not signed off.
- QA has commented sign-off on the PR. Check PR comments:
  ```bash
  gh pr view [number] --comments
  ```
  If no QA sign-off comment exists, stop. Do not review code without QA sign-off. Ask the user to have QA run their validation first.

**3. Read the spec and code**

Read the story spec:
- `design/stories/[US-XXX]-[slug].md` (story ID from PR title)

Read the code standards:
- `build/code-standards.md`

Read the diff:
```bash
gh pr diff [number]
```

Read any relevant architecture sections from `design/architecture.md` for context on which component is being modified.

**4. Review**

Evaluate against these criteria in order:

**Spec compliance**
- Does the implementation match every acceptance criterion in the story spec?
- Are edge cases and error states handled as specified?
- Is anything built that wasn't in the spec? (scope expansion is a flag, not an automatic rejection)

**Code standards**
- Does the code follow naming conventions, structure, and patterns in `build/code-standards.md`?
- Are there any deviations? If so, are they justified?

**Security surface**
- Does this PR touch auth, data handling, or external input?
- If yes, apply `skills/security-review.md`. Any blocking finding must be called out explicitly.

**Integration fit**
- Does this change interact with adjacent components correctly?
- Does it introduce any side effects or dependencies the Engineering Lead wasn't aware of?

**5. Post the review**

**If approving:**
```bash
gh pr review [number] --approve --body "
**Engineering Lead review — Approved**

Spec compliance: [summary — all ACs met / any notes]
Code standards: [pass / any notes]
Security: [N/A / pass / findings addressed]
Integration: [pass / any notes]

Ready for merge.
"
```

**If requesting changes:**
```bash
gh pr review [number] --request-changes --body "
**Engineering Lead review — Changes requested**

[For each issue:]
**[Category: Spec / Standards / Security / Integration]**
- Issue: [what specifically is wrong]
- Location: [file:line if relevant]
- Required fix: [what needs to change — be specific and actionable]

[Separate blocking issues from non-blocking observations clearly]
"
```

Do not approve a PR with unresolved blocking issues. Do not leave a PR with vague feedback — every requested change must be specific and actionable.

---

## After approval

The PR is approved and waiting for human merge. No further action needed — the human reviews and merges via GitHub.

If the human wants a summary before merging, run `/github-status` to see the current state of all PRs.
