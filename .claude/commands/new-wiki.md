Set up the wiki knowledge base for this project.

Read `project-brief.md` at the project root to understand the project domain, name, and goals.

---

## Step 1 — Scaffold the directory structure

Create the following directories and files if they do not already exist:

```
wiki/
  raw/           ← place source documents here (immutable once added)
  inbox/         ← drop new sources here; agents process from here
  pages/
    competitors/
    market/
    technical/
    users/
    concepts/
    synthesis/
```

---

## Step 2 — Generate the wiki schema

Copy `.agency/templates/wiki/schema-CLAUDE.md` to `wiki/CLAUDE.md`.

Customize it for this project:
- Replace `[Project Name]` with the actual project name from `project-brief.md`
- Review the default page categories against the project domain. For a B2C consumer app, the defaults are fine. For an internal tool, B2B SaaS, or non-standard domain, adjust category names and descriptions to fit what will actually be researched. Use judgment — fewer, well-named categories beat many vague ones.
- Update the Purpose section with one sentence specific to what this project needs to learn.

---

## Step 3 — Initialize index and log

Copy `.agency/templates/wiki/index.md` to `wiki/index.md`. Update the category names to match whatever was set in `wiki/CLAUDE.md`.

Copy `.agency/templates/wiki/log.md` to `wiki/log.md`. Append the first log entry:

```
## [today's date] init | Wiki initialized for [Project Name]
```

---

## Step 4 — Confirm and orient

Tell the user:
- The wiki is set up at `wiki/`
- How to add sources: drop files into `wiki/inbox/` and mention them in the chat — any agent can ingest them, or just ask Claude to process the inbox
- The wiki will be populated automatically during `/discovery` and `/architecture`
- They can run `/wiki-lint` at any time to check wiki health
- The schema at `wiki/CLAUDE.md` can be edited to adjust categories or conventions as the project evolves
