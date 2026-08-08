# Architecture Decision Records

ADRs live in `docs/adr/`. Create the directory lazily — only when the first ADR is needed.

## File naming

Use Zulu time followed by a slug matching the title:

```
20260515T091541Z-event-sourced-orders.md
```

## Template

```md
# {Short title of the decision}

{1-3 sentences: what's the context, what did we decide, and why.}
```

That's it. An ADR can be a single paragraph. The value is in recording *that* a decision was made and *why* — not in filling out sections.

The title should make the decision scannable without opening the file. Title and filename slug must match.

## Optional sections

Only include these when they add genuine value. Most ADRs won't need them.

- **Consequences** — only when non-obvious downstream effects need to be called out
- **Options Considered** — only when the rejected alternatives are worth remembering

## When to write an ADR

All three of these must be true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful
2. **Surprising without context** — a future reader will look at the code and wonder "why on earth did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons

If a decision is easy to reverse, skip it. If it's not surprising, nobody will wonder why. If there was no real alternative, there's nothing to record.

### What qualifies

- **Architectural shape.** "We're using a monorepo." "The write model is event-sourced."
- **Integration patterns between contexts.** "Ordering and Billing communicate via domain events, not synchronous HTTP."
- **Technology choices that carry lock-in.** Database, message bus, auth provider, deployment target. Not every library — just the ones that would take a quarter to swap out.
- **Boundary and scope decisions.** "Customer data is owned by the Customer context; other contexts reference it by ID only."
- **Deliberate deviations from the obvious path.** "We're using manual SQL instead of an ORM because X." These stop the next engineer from "fixing" something that was deliberate.
- **Constraints not visible in the code.** "We can't use AWS because of compliance requirements."
- **Rejected alternatives when the rejection is non-obvious.** If you considered GraphQL and picked REST for subtle reasons, record it — otherwise someone will suggest it again in six months.