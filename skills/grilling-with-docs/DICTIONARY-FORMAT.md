# DICTIONARY.md

## What it is

A single file at the repo root that defines the precise language of this project — the terms, their meanings, their relationships, and the words to avoid.

## Default to minimal

The baseline entry is a bolded term and a single-sentence definition. Nothing else. Add more only when the term genuinely earns it (see "How much detail per term" below). Most terms in most projects should be one or two lines.

## Structure

The only required sections are the title, the one-line domain description, and `## Terms`. Every other section is opt-in and should be omitted when there's nothing meaningful to put in it. An empty or thinly populated section is worse than no section.

```md
# {Project Name} Dictionary

{One or two sentence description of the project's domain.}

## Terms

**{Term}**:
{One-sentence definition of what it is.}
_Synonyms_: {only if there are real competing words in use}
_Avoid_: {only if a wrong synonym is actively causing confusion}

## Relationships (opt-in)

- A **{Term A}** {verb} one or more **{Term B}**
- A **{Term B}** belongs to exactly one **{Term C}**

## Example dialogue (opt-in, rare)

> **Dev:** "{Question using the terms naturally}"
> **Domain expert:** "{Answer that clarifies a boundary or rule}"

## Flagged ambiguities (opt-in, rare)

- "{ambiguous word}" was used to mean both **{Term X}** and **{Term Y}** — resolved: {resolution}.
```

## How much detail per term

Scale the entry to how much the term deviates from common usage in software. Ask: would a competent engineer joining this project guess wrong about what this means? The further the answer is from "no," the more the term earns.

- **One-liner (default).** Term + one-sentence definition. Use this for any term whose meaning matches its common-industry usage. Examples: _super admin_, _audit log_, _webhook_. If the answer is "it's the obvious thing," write only the obvious thing.
- **One-liner + `_Avoid_`.** Add `_Avoid_` only when the codebase or team actively mixes in a wrong synonym that you want to suppress. Don't preemptively list synonyms nobody uses.
- **Full entry (definition + `_Avoid_` + relationships).** Reserve for load-bearing domain terms whose meaning is project-specific, where getting the wrong mental model would cause real bugs or miscommunication. Examples: _Order_, _Invoice_, _Fulfillment_ in a logistics system.

If you find yourself writing more than one sentence to define a term, stop and check whether the extra sentence is definition or behavior. Behavior belongs in code, not the dictionary.

## Example

```md
# Acme Logistics Dictionary

Order management and fulfillment for Acme's B2B logistics platform.

## Terms

**Order**:
A request from a customer for one or more items to be delivered.
_Avoid_: Purchase, transaction

**Invoice**:
A request for payment sent to a customer after delivery.
_Avoid_: Bill, payment request

**Customer**:
A person or organization that places orders.
_Avoid_: Client, buyer, account

## Relationships

- An **Order** produces one or more **Invoices**
- An **Invoice** belongs to exactly one **Customer**

## Example dialogue

> **Dev:** "When a **Customer** places an **Order**, do we create the **Invoice** immediately?"
> **Domain expert:** "No — an **Invoice** is only generated once a **Fulfillment** is confirmed."

## Flagged ambiguities

- "account" was used to mean both **Customer** and **User** — resolved: these are distinct concepts.
```

## Rules

- **Keep definitions tight.** One sentence max. Define what it IS, not what it does.
- **Default to the minimum entry.** A bolded term and one sentence. Add `_Synonyms_`, `_Avoid_`, or relationships only when there's a concrete reason in this project — not because the template has a slot for them.
- **Only include terms specific to this project's domain.** General programming and generic SaaS concepts (heartbeat, polling, timeouts, super admin, audit log, error types, utility patterns) don't need rich entries. If a term is generic but worth listing for shared vocabulary, give it the one-liner treatment and move on. Be strict — a lean dictionary is the goal.
- **Show relationships only when they constrain behavior.** Express cardinality where it matters (e.g. "an Invoice belongs to exactly one Customer"). Skip relationships that are obvious from the names.
- **Group terms under subheadings (opt-in)** when natural clusters emerge. If all terms belong to a single cohesive area, a flat list under "Terms" is fine.
- **Write an example dialogue (opt-in, rare).** Only when a short dev/domain-expert exchange clarifies a boundary that the definitions alone can't. If you can't think of a real misunderstanding it would prevent, skip it.
- **Flag conflicts explicitly (opt-in, rare).** Only when a term has actually been used to mean two different things in this project's code, docs, or discussions. Do not invent hypothetical conflicts. If nothing genuinely conflicts, omit the section entirely.

## Location

Always a single `DICTIONARY.md` at the repo root. If it doesn't exist yet, create it when the first term is resolved.