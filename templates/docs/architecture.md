# Architecture Document

**Created by:** Systems Architect
**Project:** [Project Name]
**Version:** 1.0
**Date:** [YYYY-MM-DD]
**Status:** Draft | Approved

---

## System Overview
[2–3 sentences. What is this system, what does it do at a high level, and what are the key architectural principles guiding its design?]

## Guiding Principles
The values that drove architectural decisions on this project.

-
-
-

---

## Architecture Diagram
[Describe the system — components and their relationships. Use ASCII art or clear prose. Must be unambiguous.]

```
[Client]
    │
    ▼
[API Layer] ──── [Auth Service]
    │
    ├──── [Service A]
    │         │
    │         ▼
    │     [Database A]
    │
    └──── [Service B]
              │
              ▼
          [Database B]
```

---

## Components

### [Component Name]
**Responsibility:** [What it does and nothing more — single responsibility stated clearly]
**Technology:** [Language, framework, runtime, version]
**Interfaces:** [How it communicates — REST, gRPC, event, direct call — and with what]
**Scaling:** [How this component scales if needed]
**Key decisions:** [Any non-obvious choices made here]

---

[Repeat for each component]

---

## Data Model

### [Entity Name]
| Field | Type | Required | Indexed | Notes |
|-------|------|----------|---------|-------|
| id | | Yes | Yes | |
| | | | | |

### Relationships
[How entities relate. State cardinality explicitly.]

- [Entity A] has many [Entity B]
- [Entity B] belongs to [Entity A]

### Data Flow
[How data moves through the system for the primary use cases.]

---

## Tech Stack

| Layer | Choice | Version | Rationale |
|-------|--------|---------|-----------|
| Frontend | | | |
| Backend | | | |
| Database | | | |
| Cache | | | |
| Message queue | | | |
| Infrastructure | | | |
| CI/CD | | | |
| Monitoring | | | |
| Error tracking | | | |

---

## Integration Points

| Service / API | Purpose | Auth Method | Rate Limits | Failure Mode |
|---------------|---------|-------------|-------------|--------------|
| | | | | |

---

## Non-Functional Requirements

| Requirement | Target | Approach | Notes |
|-------------|--------|----------|-------|
| Response time (p95) | | | |
| Availability | | | |
| Concurrent users at launch | | | |
| Data retention | | | |
| Security standard | | | |

---

## Infrastructure

### Environments
| Environment | Purpose | Notes |
|-------------|---------|-------|
| Development | | |
| Staging | | |
| Production | | |

### Deployment Approach
[How the system is deployed. CI/CD pipeline, hosting platform, containerization if any.]

### Scaling Approach
[How the system handles increased load. Horizontal / vertical / auto-scaling decisions.]

### Backup & Recovery
[Data backup frequency, retention, and recovery time objective (RTO).]

---

## Security

### Authentication & Authorization
[How users are authenticated. How permissions are enforced.]

### Data Handling
[How sensitive data is stored, transmitted, and protected. Encryption at rest / in transit.]

### Key Security Decisions
-

---

## Known Constraints
[Technical, timeline, or budget constraints that shaped architecture decisions.]

-

## What This Architecture Rules Out
[Things that are now harder or impossible because of the decisions made here. Be honest.]

-
