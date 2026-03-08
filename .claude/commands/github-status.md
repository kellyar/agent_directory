Show the current state of all open pull requests for this project.

Prerequisites: `gh` CLI must be authenticated (`gh auth status`). If not, stop and ask the user to run `gh auth login` first.

---

## Process

**1. Fetch open PRs**

```bash
gh pr list --base main --json number,title,isDraft,headRefName,reviewDecision,statusCheckRollup,createdAt,author
```

**2. Fetch comments for QA sign-off status**

For each open PR:
```bash
gh pr view [number] --comments
```
Look for a QA sign-off comment. Note its presence or absence.

**3. Display**

Present a clear summary grouped by state:

---

**Draft** *(in progress — not ready for review)*
| PR | Story | Branch | CI | QA |
|----|-------|--------|----|----|
| #[N] | [US-XXX title] | `feature/...` | Passing / Failing / Pending | Pending |

**Ready for Review** *(awaiting Engineering Lead review)*
| PR | Story | Branch | CI | QA | Open since |
|----|-------|--------|----|----|------------|
| #[N] | [US-XXX title] | `feature/...` | Passing / Failing / Pending | Signed off / Pending | [date] |

**Approved** *(Engineering Lead approved — awaiting human merge)*
| PR | Story | Branch | CI | Approved by |
|----|-------|--------|----|----|
| #[N] | [US-XXX title] | `feature/...` | Passing | Engineering Lead |

---

**4. Surface blockers**

Call out clearly:
- PRs where CI is **failing** — these cannot merge until fixed
- PRs that are **Ready for Review but have no QA sign-off** — should not be reviewed yet
- PRs that have been **Ready for Review for more than 24 hours** without Engineering Lead action
- PRs that are **Approved and ready to merge** — waiting on the human

**5. Next actions**

State the recommended next action for each blocked PR:
- Failing CI → Developer needs to fix
- No QA sign-off → QA needs to validate on the branch
- Awaiting Engineering Lead review → run `/github-review`
- Approved, awaiting merge → ready for human action in GitHub
