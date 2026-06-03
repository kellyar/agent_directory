Log a feature request as a GitHub Issue using the project's feature request template.

Prerequisites: `gh` CLI must be authenticated (`gh auth status`). If not, stop and ask the user to run `gh auth login` first.

---

## Process

**1. Gather feature details**

If the user has provided details inline with the command, use them. Otherwise, ask for the following fields:

- **Problem** — what pain does this solve, and for whom? Lead with the problem, not the solution. (required)
- **Proposed solution** — what would you like to see? A description, sketch, or reference to another app. (required)
- **Area** — which part of the app this affects (use the project's area labels if defined; skip if none match)
- **Importance** — one of: `blocking` / `high` / `medium` / `low` (required)
  - blocking = can't use the app effectively without it
  - high = hit this pain every session
  - medium = meaningful improvement
  - low = nice to have
- **Alternatives** — workarounds tried or other ways to solve this (optional)

**2. Confirm before creating**

Present a preview of the issue:

```
Title: [short title derived from the problem — 8 words max]
Labels: type: feature, status: triage, priority: [mapped from importance], area: [area if provided]

Problem:
[problem]

Proposed solution:
[solution]

Importance: [importance]
Alternatives: [alternatives or "None noted"]
```

Ask: "Create this issue? (yes / edit)"

If "edit", ask which field to change and loop back.

**3. Derive the title**

If the user hasn't provided a title, synthesise one from the problem/solution in the style:
`[Verb] [what] [where/when]` — e.g. "Show export progress in toolbar during batch export"

Keep it under 8 words. Concrete nouns, active verbs. No "add support for" or "improve".

**4. Map importance → priority label**

| Importance | Priority label |
|---|---|
| blocking | `priority: critical` |
| high | `priority: high` |
| medium | `priority: medium` |
| low | `priority: low` |

**5. Create the issue**

```bash
gh issue create \
  --title "[title]" \
  --body "$(cat <<'EOF'
## What problem does this solve?
[problem]

## Proposed solution
[solution]

## Importance
[importance — capitalised with description, e.g. "High — I hit this pain point every session"]

## Alternatives considered
[alternatives or "None noted"]
EOF
)" \
  --label "type: feature" \
  --label "status: triage" \
  --label "priority: [mapped]" \
  --label "area: [area]"
```

> If a label doesn't exist yet, `gh` will error. Tell the user which label is missing and suggest creating it. Then create the issue without that label as a fallback so the request isn't lost:
> ```bash
> gh issue create --title "[title]" --body "[body]"
> ```

**6. Confirm**

Output the issue URL and number. Example:

```
Feature logged: #43 — [title]
https://github.com/[owner]/[repo]/issues/43
```
