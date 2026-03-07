# Skill: Assumption Mapping

## Purpose
Surface and rate the assumptions underlying a plan so the riskiest unknowns are visible before committing to a direction. Used at Checkpoint 1 (by Product Strategist) and Checkpoint 2 (by Systems Architect).

## When to Apply
- Before finalizing a Problem Statement or Solution Direction
- Before committing to an architecture or tech stack
- Whenever a plan feels solid but hasn't been stress-tested

## Process

### 1. List All Assumptions
Write down every assumption the plan depends on being true. Include:
- User behavior assumptions ("users will do X")
- Market assumptions ("this problem is common enough to build for")
- Technical assumptions ("this API can handle our load")
- Business assumptions ("this can be built within the constraints")

### 2. Rate Each Assumption
Score on two axes:

| Axis | Low | High |
|------|-----|------|
| **Confidence** | We don't know if this is true | We have strong evidence this is true |
| **Impact** | If wrong, minor course correction | If wrong, the direction collapses |

### 3. Prioritize Action
Focus on **High Impact / Low Confidence** assumptions — these are the ones that must be validated or mitigated before proceeding.

| Quadrant | Action |
|----------|--------|
| High Impact / Low Confidence | Must validate or de-risk before proceeding |
| High Impact / High Confidence | Monitor; document evidence |
| Low Impact / Low Confidence | Accept the risk; note it |
| Low Impact / High Confidence | No action needed |

### 4. Output
Produce an **Assumption Map** with:
- All assumptions listed
- Each rated by confidence and impact
- Priority actions for High Impact / Low Confidence items
- Open questions that require human input or further research

## Notes
- Be honest about confidence levels. Overconfidence is the most common failure mode.
- Assumptions about user behavior are almost always lower confidence than they feel.
- If there are more than 3 High Impact / Low Confidence assumptions, the plan needs more discovery before proceeding.
