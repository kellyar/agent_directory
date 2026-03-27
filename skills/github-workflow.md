# Skill: GitHub Workflow

## Purpose
Define the branching strategy, PR process, and merge gate that all Build Team agents follow. Ensures every story is developed in isolation, reviewed before merge, and that `main` is always in a deployable state.

## When to Apply
- **Developer:** when starting and completing any task
- **Engineering Lead:** when setting up code standards and reviewing PRs
- **QA Engineer:** when validating completed work before PR review
- **DevOps Engineer:** when configuring the repository and CI/CD pipeline

---

## Branching Strategy

One branch per user story. Always cut from `main`.

| Branch type | Pattern | Example |
|------------|---------|---------|
| Feature (story) | `feature/US-[XXX]-[slug]` | `feature/US-012-user-login` |
| Bug fix | `fix/[slug]` | `fix/broken-auth-redirect` |
| Infrastructure / DevOps | `infra/[slug]` | `infra/ci-pipeline-setup` |
| Chore | `chore/[slug]` | `chore/update-dependencies` |

**Rules:**
- One story = one branch. Do not bundle multiple stories into a single branch.
- Branch names are lowercase and hyphenated, including the story ID where one exists.
- Delete the branch after it is merged.
- Never commit directly to `main`.

---

## Developer Workflow (per story)

1. **Create the branch** from latest `main`:
   ```bash
   git checkout main && git pull origin main
   git checkout -b feature/US-[XXX]-[slug]
   ```
2. **Implement** against the spec. Commit regularly with meaningful messages (see format below).
3. **Open a Pull Request** to `main` — mark as **Draft** during implementation:
   - Title: `[US-XXX] Story title`
   - Body: acceptance criteria checklist, link to story spec, notes for reviewer
4. When implementation is complete, notify QA to validate on the branch.
5. Once QA has signed off: mark the PR **Ready for Review**.
6. Do not merge your own PR. The Engineering Lead reviews; the human approves and merges.

> **Stacked PRs:** If this PR was built on top of another feature branch (stacked), confirm the base branch is retargeted to `main` before the human merges. Merging into a feature branch instead of `main` will cause the work to be missing from `main` and require a cherry-pick to recover. Always verify the PR's base branch in GitHub before requesting human merge.

---

## Commit Message Format

```
[US-XXX] Short description in imperative mood (max 72 chars)
```

Examples:
- `[US-012] Add login form with email and password fields`
- `[US-023] Validate token expiry on protected routes`
- `fix: correct null check in user profile loader`

---

## PR Requirements

A PR must meet all of the following before it is eligible for human merge:

- [ ] All CI checks pass (tests, linting, build)
- [ ] QA sign-off commented on the PR (not just in the QA Report)
- [ ] Engineering Lead code review approved
- [ ] No unresolved review comments
- [ ] Human approval given in GitHub

**Human merge gate:** Merging to `main` always requires explicit human approval — regardless of project mode (Guided or Autonomous). This is not a checkpoint that can be bypassed. It is a permanent gate on `main`.

---

## Engineering Lead: PR Review

- Review every PR before it is eligible for human merge.
- Review focuses on: spec compliance, code correctness, standards adherence, security surface, integration fit.
- Approve when satisfied — this signals to the human that the PR is ready to merge.
- If changes are needed: request changes with specific, actionable feedback. Do not approve until addressed.
- Do not merge PRs directly. The human merges after Engineering Lead approval.

---

## QA: Validating on the Feature Branch

1. Check out the feature branch locally.
2. Run the story's test cases against the branch.
3. Record results in the QA Report (`build/qa-reports/`).
4. **Comment on the PR** with QA sign-off status — this is what makes the sign-off visible to the Engineering Lead and human reviewer.
5. If blocking issues remain: the PR stays Draft until resolved. Do not mark Ready for Review with open blocking issues.

---

## DevOps: Repository Configuration

Set up the following before the first Developer commit:

**Branch protection on `main`:**
- Require a pull request before merging (no direct pushes)
- Require at least 1 human approval
- Require status checks to pass (CI tests, linting) before merging
- Require branches to be up to date before merging

**CI on pull requests:**
- Run full test suite on every PR push
- Run linting and formatting checks
- Report results to PR status checks
- Block merge if any check fails

---

## What "main is always deployable" means

Every commit on `main` must be in a state that could be deployed to production:
- All tests pass
- No half-implemented features without a feature flag
- No debug code or temporary workarounds
- The merged story does what its acceptance criteria say

If a merged PR breaks `main`, the Engineering Lead treats fixing it as the highest priority — above all other sprint work.
