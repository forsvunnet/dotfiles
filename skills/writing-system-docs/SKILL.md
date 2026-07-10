---
name: writing-system-docs
description: Conventions for writing system documentation that explains a problem clearly. Use when writing or revising explanatory docs, design notes, or problem write-ups, especially when a single explanation is tangling several distinct problems together.
---

# Writing style guide for system documentation

Follow these conventions when writing a document that explains how a system works or why something breaks.

## The core principle: separate distinct problems

This is the most important rule. Most confusion in these documents comes from tangling separate problems into one explanation. Before writing, list the distinct problems and keep each one in its own section. If a single sentence is trying to describe two issues, split it. If a "why it happens" explanation quietly reintroduces a problem from another section, cut it.

A good test: for every claim, ask which single problem it belongs to. If the answer is "two of them," the writing is tangled and needs splitting.

## Voice: write about the system, not about people

Write in documentation voice. The subject is the system, not the team. Avoid "we," "our," and "your." Say what the system does, not what the people who built it decided.

Weak: "We collapse age groups into our model."
Better: "The system collapses age groups into a smaller set of values."

The exception is the status or background section, where it is fine to describe expectations and intent in a neutral way.

## Language: plain and low-density

Use simple words. Avoid vocabulary that carries a lot of meaning per word, because it forces the reader to unpack each term. A word like "resolvability" or "coerce" reads as precise to the writer but slows the reader down. Prefer the plainer phrasing even when it takes a few more words.

Keep sentences short. One idea per sentence. If a sentence has a clause that adds a second idea, consider making it its own sentence.

## Punctuation: no dashes for pause

Do not use em dashes or other dashes to create a pause or aside. Restructure the sentence instead, usually by splitting it or using a comma.

## Be careful about blame and cause

When describing why something breaks, name the cause that actually belongs to that section and no other. Do not let one party absorb blame for a cause that belongs to another.

For example, "the vendor's details aren't enough" can hide two different causes: one where the vendor genuinely sent too little, and one where the system's own normalization threw away detail the vendor did provide. These are a data-quality problem and a design tradeoff, and they belong in separate sentences with the cause correctly assigned.

## Keep the document general, keep examples in their place

A specific example is useful for reaching shared understanding during discussion, but it often complicates the general explanation in the finished document. Decide deliberately whether an example earns its place. If the point stands without it, leave it out. If the reader needs an anchor, include one short, neutral example and label it as an example.

Be clear about the difference between context that helped you understand the problem and the description of the problem itself. The first does not always belong in the document.

## Define coined and ambiguous terms up front

If the document uses a word in a specific way, or coins a term, define it in a short terms section at the top. This removes ambiguity before the reader hits the term in context.

## Be honest about gaps

Close with a status that states plainly what is known, what is assumed, and what has not yet been tested. It is acceptable, and better, to say that a failure case has not appeared yet and will be handled when a real example shows up, rather than to overstate confidence or build for problems that may never arrive.

## Suggested section order

A workable default structure, adapt as needed:

1. Terms
2. Overview, including a note that the problems are separated on purpose
3. One section per distinct problem
4. Status

## Process, not just output

Build shared understanding before writing the final text. Good documents come together through back-and-forth that clarifies the real problem, which often turns out to be different from the first framing. Ask one question at a time, let each answer steer the next, and only write the polished version once the shape of the problem is agreed. Writing too early locks in a framing that may be wrong.
