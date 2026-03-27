# Release Checklist

**Project:** [Project Name]
**Release:** [Version / Milestone name]
**Date:** [YYYY-MM-DD]
**Release lead:** Engineering Lead
**Status:** Pending | Approved to Ship | Blocked

This checklist is the final gate before production deployment. Every item must be checked or explicitly accepted as a known gap before proceeding.

---

## Code & Quality

- [ ] All acceptance criteria for this release are passing
- [ ] QA sign-off received for all milestone stories
- [ ] No blocking issues open in QA reports
- [ ] All tests passing in CI (unit, integration, E2E)
- [ ] No new linter errors or type errors introduced
- [ ] Security review completed for all features with a security surface
- [ ] No known CVEs in dependencies (dependency audit run and clean)
- [ ] Code review completed by Engineering Lead for all PRs in this release

## Infrastructure & Deployment

- [ ] Production environment is provisioned and healthy
- [ ] Staging deployment completed and smoke tested
- [ ] All environment variables and secrets set in production
- [ ] No development or staging secrets in production
- [ ] CI/CD pipeline deploys successfully to staging
- [ ] Deployment runbook is up to date and tested
- [ ] Rollback procedure is documented and tested
- [ ] Database migrations (if any) are backwards-compatible or have a rollback plan
- [ ] Database migration step confirmed to run successfully in the production environment (not just locally)

## Monitoring & Observability

- [ ] Error tracking is active in production (Sentry / equivalent)
- [ ] Uptime monitoring is configured
- [ ] Key metric alerts are set and routed to the right people
- [ ] Dashboards are accessible and populated with staging data
- [ ] On-call contact is confirmed and available post-deploy

## Analytics & Instrumentation

- [ ] All analytics events validated in staging
- [ ] No PII leaking to analytics platforms
- [ ] Success metric dashboards are ready
- [ ] Analytics plan sign-off received from Analytics Engineer

## Documentation

- [ ] README reflects the current state of the project
- [ ] Any new environment variables are documented
- [ ] API changes (if any) are documented
- [ ] Deployment runbook reflects any changes made during this release

## Stakeholders & Communications

- [ ] Relevant stakeholders notified of the release plan
- [ ] Any user-facing changes communicated (if applicable)
- [ ] Support team briefed (if applicable)

---

## Known Gaps
*Items that are not checked but have been explicitly accepted as known gaps for this release.*

| Item | Gap description | Accepted by | Plan to resolve |
|------|----------------|-------------|-----------------|
| | | | |

---

## Release Decision

**Approved to ship:** Yes / No / Conditional

**Conditions (if conditional):**
-

**Approved by:** [Engineering Lead + Human sign-off in Guided mode]

**Deployment scheduled:** [YYYY-MM-DD HH:MM timezone]
