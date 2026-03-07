# Infrastructure Plan

**Created by:** DevOps Engineer
**Project:** [Project Name]
**Date:** [YYYY-MM-DD]
**Based on:** `design/architecture.md` (approved at CP2)

---

## Overview
[1–2 sentences. What is being provisioned, where, and what's the guiding infrastructure philosophy for this project — e.g., "Minimal managed services on a single cloud provider; optimise for simplicity over scalability at this stage."]

---

## Cloud Provider & Core Services

**Provider:** [AWS / GCP / Azure / Other]

| Service | Purpose | Tier / Config | Notes |
|---------|---------|---------------|-------|
| | | | |

---

## Environments

| Environment | Purpose | Isolation | Notes |
|-------------|---------|-----------|-------|
| Development | Local dev + feature branches | | |
| Staging | Pre-production validation | Separate from prod | |
| Production | Live system | | |

### Environment Parity
[What's different between staging and production, and why? Differences create risk — document them explicitly.]

---

## Infrastructure as Code

**IaC tool:** [Terraform / Pulumi / CDK / CloudFormation / Other / None]
**Repository location:** [Where IaC lives]
**State management:** [How IaC state is stored and shared]

---

## CI/CD Pipeline

**Platform:** [GitHub Actions / CircleCI / GitLab CI / Other]

### Pipeline Stages
| Stage | Trigger | What it does | Blocks merge? |
|-------|---------|-------------|---------------|
| Build | Every push | Compile, lint | Yes |
| Test | Every push | Unit + integration tests | Yes |
| Security scan | Every push | Dependency audit, SAST | Yes |
| Deploy to staging | Merge to main | Deploy + smoke test | Yes |
| Deploy to production | Manual trigger / tag | Deploy + health check | — |

### Branch Strategy
[Which branches exist, what they map to, and what protection rules apply]

---

## Secrets & Configuration Management

**Secrets tool:** [AWS Secrets Manager / HashiCorp Vault / Doppler / GitHub Secrets / Other]

| Secret | Environment(s) | Owner | Rotation policy |
|--------|---------------|-------|----------------|
| | | | |

**Rules:**
- Secrets are never hardcoded or committed to the repository
- Each environment has its own secret values — no sharing across environments
- Developers have access to development secrets only

---

## Monitoring & Alerting

**Monitoring platform:** [Datadog / CloudWatch / Grafana / Other]
**Error tracking:** [Sentry / Bugsnag / Rollbar / Other]
**Uptime monitoring:** [Tool + check frequency]

### Key Metrics to Monitor
| Metric | Warning threshold | Critical threshold | Alert channel |
|--------|------------------|-------------------|---------------|
| Error rate | | | |
| Response time (p95) | | | |
| Uptime | | | |
| [App-specific metric] | | | |

### On-call
**Who gets alerted:** [person / rotation]
**Escalation path:** [if primary doesn't respond]

---

## Deployment Runbook

### Deploy to Staging
1. [Step]
2. [Step]
3. Verify: [health check URL or command]

### Deploy to Production
1. [Step]
2. [Step]
3. Verify: [health check URL or command]
4. Monitor for [X minutes] post-deploy before marking complete

### Rollback Procedure
**Trigger:** [What condition triggers a rollback decision]
**Steps:**
1. [Step]
2. [Step]
**Target RTO:** [Time to restore service]

---

## Cost Estimate

| Service | Monthly (current) | Monthly (10× scale) | Notes |
|---------|-------------------|----------------------|-------|
| | | | |
| **Total** | | | |

---

## Security Configuration

- **Network:** [VPC setup, public vs private subnets, security groups]
- **IAM / permissions:** [Least privilege approach, service account setup]
- **Admin access:** [Who has prod access, how it's controlled]
- **Compliance requirements:** [Any standards that apply — SOC2, GDPR, HIPAA]
