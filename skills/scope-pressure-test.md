# Skill: Scope Pressure Test

## Purpose
Validate that scope is appropriately sized for its stated purpose. Applied by the Product Manager to validate MVP scope and by the Engineering Lead to validate that the implementation plan is buildable. Prevents the two most common scoping failures: building too much before validating, and building too little to be useful.

## When to Apply
- PM: After drafting the initial backlog, before producing the Checkpoint 2 package
- Engineering Lead: After receiving the approved backlog, before producing the implementation plan

## Process

### For Product Managers — Is this actually an MVP?

Ask each of these. If the answer to any is "no," scope needs to be cut.

1. **Core value test:** Does the MVP deliver the single most important job-to-be-done for the primary persona, end-to-end?
2. **Minimum test:** Is there anything in the MVP scope that a user could succeed without on day one? If yes, move it to V2.
3. **Validation test:** Does this MVP let us learn the thing we most need to learn to decide whether to build more?
4. **Dependency test:** Are all MVP features actually required for each other, or have non-essential features been bundled in?

If more than 2 features survive the minimum test review without clear justification, escalate to the Orchestrator — the MVP line needs a human decision.

### For Engineering Leads — Is this actually buildable?

Ask each of these. If the answer to any is "no," escalate before committing.

1. **Clarity test:** Is every task in the plan defined clearly enough that a Developer can execute it without making a product decision?
2. **Dependency test:** Are all task dependencies mapped? Is the build order correct?
3. **Risk concentration test:** Are the hardest/riskiest tasks scheduled early so problems surface before they block other work?
4. **Completeness test:** Is there anything in the approved backlog not accounted for in the plan?
5. **Integration test:** Is there a clear plan for how components built in parallel get integrated and tested together?

## Output
A pass/fail per question, with notes on anything that failed and the recommended action.

## Notes
- Scope pressure testing is not about making the product smaller for its own sake — it's about protecting the team from committing to more than can be validated or delivered well.
- If the scope fails the pressure test, that's useful information. Surface it clearly rather than quietly adjusting scope without flagging it.
