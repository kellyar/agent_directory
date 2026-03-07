# Analytics Plan

**Created by:** Analytics Engineer
**Project:** [Project Name]
**Date:** [YYYY-MM-DD]
**Based on:** `design/prd.md` (Success Metrics, Section 2) + `design/ux-flows.md`

---

## Overview
[1–2 sentences. What analytics platform is being used and what is the primary goal of instrumentation on this project — e.g., "Validate that users are completing onboarding and reaching the core value moment within their first session."]

**Analytics platform:** [Mixpanel / Amplitude / PostHog / Segment / GA4 / Custom / Other]

---

## Metric-to-Event Map

Every success metric from the PRD must trace to a specific, measurable event. If a metric cannot be mapped, it is escalated to the PM before instrumentation begins.

| Success Metric (from PRD) | Event(s) that measure it | Measurable? | Notes |
|--------------------------|--------------------------|-------------|-------|
| | | Yes / No / Partially | |

---

## Event Definitions

### [Event Name — e.g., `user_signed_up`]
**Triggered when:** [Exact moment this event fires]
**Triggered by:** [Which component / action / user behaviour]
**Maps to metric:** [Which PRD success metric this serves]

**Properties:**
| Property | Type | Description | Example |
|----------|------|-------------|---------|
| | string / number / boolean | | |

**PII check:** Does this event contain PII? Yes / No
- If yes: [What PII, why it's necessary, how it's handled]

---

[Repeat for each event]

---

## Events Not Tracked
[Any user actions or moments that were considered but deliberately excluded from tracking — and why.]

-

---

## Implementation Notes

**Where events are implemented:** [Frontend / Backend / Both]
**Instrumentation approach:** [SDK calls, server-side, GTM, etc.]

| Event | Implementation location | Developer assigned | Status |
|-------|------------------------|-------------------|--------|
| | | | Not started |

---

## Dashboard Spec

The dashboards that make success metrics visible without manual data pulls.

### Dashboard: [Name — e.g., "Core Funnel"]
**Audience:** [Who looks at this — founders, PMs, engineering]
**Updates:** [Real-time / hourly / daily]

| Chart | Metric | Visualisation | Notes |
|-------|--------|---------------|-------|
| | | Line / Bar / Funnel / Number | |

---

## Validation Checklist

Before production deployment, confirm each item in staging:

| Event | Fires at the right moment | Properties correct | No PII leak | Status |
|-------|--------------------------|-------------------|-------------|--------|
| | [ ] | [ ] | [ ] | |

**Validation sign-off:** [Analytics Engineer sign-off before release]

---

## Privacy & Compliance

- [ ] No PII sent to analytics platforms without explicit design intent
- [ ] Data retention settings configured on the analytics platform
- [ ] Analytics data handling documented in the project's privacy approach
- [ ] [Any jurisdiction-specific requirements — GDPR consent, CCPA opt-out]
