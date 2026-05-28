Log a bug as a GitHub Issue using the project's bug report template.

Prerequisites: `gh` CLI must be authenticated (`gh auth status`). If not, stop and ask the user to run `gh auth login` first.

---

## Process

**1. Gather bug details**

If the user has provided details inline with the command, use them. Otherwise, ask for the following fields one at a time (or as a single grouped prompt if the bug is simple):

- **Summary** — one sentence: what went wrong? (required)
- **Steps to reproduce** — numbered list of exact steps (required)
- **Expected behaviour** — what should have happened (required)
- **Actual behaviour** — what actually happened; include any error text (required)
- **Severity** — one of: `critical` / `high` / `medium` / `low` (required)
  - critical = crash or data loss
  - high = core feature broken, no workaround
  - medium = degraded, workaround exists
  - low = cosmetic or minor annoyance
- **Area** — one of: `canvas` / `export` / `layouts` / `ui` / `performance` / `ci / infra` / `other` (optional, default: skip)
- **macOS version** — e.g. "macOS Sequoia 15.2" (optional, default: "Not specified")

**2. Confirm before creating**

Present a preview of the issue:

```
Title: [summary]
Severity: [severity]
Labels: type: bug, status: triage, priority: [mapped from severity], area: [area if given]

Steps to reproduce:
[steps]

Expected: [expected]
Actual: [actual]

macOS: [version]
```

Ask: "Create this issue? (yes / edit)"

If "edit", ask which field to change and loop back.

**3. Map severity → priority label**

| Severity | Priority label |
|---|---|
| critical | `priority: critical` |
| high | `priority: high` |
| medium | `priority: medium` |
| low | `priority: low` |

**4. Create the issue**

Build the body and run:

```bash
gh issue create \
  --title "[summary]" \
  --body "$(cat <<'EOF'
## What went wrong?
[summary]

## Steps to reproduce
[steps as numbered list]

## Expected behaviour
[expected]

## Actual behaviour
[actual]

## Severity
[severity — capitalised with description, e.g. "Medium — feature is degraded but there's a workaround"]

## Environment
- **macOS:** [version]
- **App version:** Not specified
EOF
)" \
  --label "type: bug" \
  --label "status: triage" \
  --label "priority: [mapped]" \
  [--label "area: [area]" if area was provided]
```

> If a label doesn't exist yet, `gh` will error. Tell the user: "Run the `gh label create` commands in `github_issues.md` to set up labels first, then retry." Then create the issue without labels as a fallback so the bug isn't lost:
> ```bash
> gh issue create --title "[summary]" --body "[body]"
> ```

**5. Confirm**

Output the issue URL and number. Example:

```
Bug logged: #42 — Export All silently skips the last slide when canvas has 10+ images
https://github.com/kellyar/bluehour_canvas/issues/42
```
