Start a story: create the feature branch and open a Draft PR.

Run this at the beginning of a story — before writing any code.

Prerequisites: `gh` CLI must be authenticated (`gh auth status`). If not, stop and ask the user to run `gh auth login` first.

---

## Process

**1. Identify the story**

If a story ID is not clear from context, ask: "Which story are we starting? (e.g. US-012)"

Read the story spec from `design/stories/[US-XXX]-*.md`. If the spec does not exist or contains unresolved `[NEEDS CLARIFICATION]` markers, stop — the story is not ready. Direct the user to run `/refine` first.

**2. Confirm QA test cases exist**

Check `build/test-cases/` for test cases written for this story. If none exist, the story is not ready to start — QA must write and confirm failing tests before the Developer begins. See `skills/github-workflow.md` and `principles/spec-driven-development.md`.

**3. Create the branch**

```bash
git checkout main
git pull origin main
git checkout -b feature/[US-XXX]-[slug]
```

Where `[slug]` is a short, lowercase, hyphenated version of the story title (max 5 words).

**4. Push the branch and open a Draft PR**

```bash
git push -u origin feature/[US-XXX]-[slug]
```

Then open the Draft PR:

```bash
gh pr create \
  --base main \
  --draft \
  --title "[US-XXX] [Story title]" \
  --body "$(cat <<'EOF'
## Story
**[US-XXX]:** [Story title]
**Spec:** \`design/stories/[US-XXX]-[slug].md\`

## Acceptance Criteria
[Copy each acceptance criterion from the story spec as an unchecked checkbox]

## QA Sign-off
Pending — QA validates on this branch before this PR is marked Ready for Review.

## Notes for Reviewer
[Leave blank — Developer adds notes during implementation]
EOF
)"
```

**5. Confirm**

Output the PR URL. Confirm the branch is created and the PR is open as Draft. The Developer can now begin implementation.

---

## After implementation

When implementation is complete and QA has signed off on this branch, mark the PR ready:

```bash
gh pr ready
```

Then the Engineering Lead runs `/github-review` to review and approve. The human merges to `main`.
