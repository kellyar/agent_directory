# UX Flows

**Created by:** UX Designer
**Project:** [Project Name]
**Date:** [YYYY-MM-DD]

---

## Information Architecture
The structure of the product — how content and features are organized.

```
[Product Name]
├── [Section]
│   ├── [Page / View]
│   └── [Page / View]
├── [Section]
│   ├── [Page / View]
│   └── [Page / View]
└── [Section]
    └── [Page / View]
```

### Navigation Model
[What is the primary navigation pattern — tabs, sidebar, top nav, hub-and-spoke? Why this pattern for this product and user?]

---

## User Flows

### Flow: [Flow Name]
**Persona:** [Who performs this flow]
**Goal:** [What they're trying to accomplish]
**Entry point:** [Where / how they arrive at the start of this flow]

**Happy path:**
1. [User action]
2. [System response / next screen]
3. [User action]
4. [Outcome — what success looks like]

**Alternate paths:**
- If [condition]: → [Different route through the flow]
- If [condition]: → [Different route]

**Error paths:**
- If [error condition]: → [What the user sees and what they can do]
- If [error condition]: → [Recovery options]

---

[Repeat for each key flow — cover every persona's primary job to be done]

---

## Interaction Patterns
Key UX decisions that apply consistently across the product.

| Pattern | Decision | Rationale |
|---------|----------|-----------|
| Navigation | | |
| Loading states | | |
| Error handling | | |
| Empty states | | |
| Confirmation dialogs | | |
| Destructive actions | | |
| Form validation | | |
| Success feedback | | |

---

## Screen Inventory
Complete list of distinct views required. Not designs — what exists and its purpose.

| Screen | Purpose | Key Elements | Triggered By | Notes |
|--------|---------|--------------|--------------|-------|
| | | | | |

---

## States Reference
Every screen must account for all possible states. Nothing should be undefined.

| Screen | Empty State | Loading State | Error State | Partial Data | Full / Default |
|--------|-------------|---------------|-------------|--------------|----------------|
| | | | | | |

---

## Technical Notes for Architect
Implications from these flows that affect the technical design.

- [e.g., Real-time updates required on X screen]
- [e.g., Offline capability needed for Y flow]
- [e.g., Deep linking required for Z]
