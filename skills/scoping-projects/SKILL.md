---
name: scoping-projects
description: Interview the user into a written mission statement, style guide and build phases before any code exists. Use when starting a new project or sub-project, when a request is bigger than a single change, or when the user asks to agree on what something is before building it.
---

Write the project as prose at descending levels of abstraction. The whole thing
in a sentence first, then what it is made of, then how those parts are written,
then the order they arrive in. Each document sits at one level and stays there.
Nothing skips ahead.

None of it gets built until those documents exist and the user has read and
agreed to them.

## The artifacts

Three documents, produced in this order, each one settling the vocabulary the
next one argues in.

**The mission statement.** What the thing is, who it is for, what it refuses to
do. One page. If it does not fit on a page, the project is not understood yet.

**The style guide.** How the code is written. Layout, data shapes, naming,
error handling, what a new contributor has to copy. Written after the shape of
the thing is settled and before any of it exists.

**The phases.** What order it gets built in, and why that order.

Commit all three before writing code. They are the first deliverable, not a
preamble to it.

## Placing a sentence

Prose, not lists. A list lets decisions sit side by side without ever saying how
they relate, and a paragraph that will not come out is the discovery.

To place a sentence, ask whether it would still be true after everything below it
were replaced. "The run never waits" survives swapping the language, so it is
mission. "Install PHP through Homebrew" dies with that choice, so it belongs a
layer down.

Leaking is the failure mode, and it runs both ways. Detail drifting up makes the
mission fragile, so a decision one layer down forces a rewrite of the page above.
The mission restated in the style guide leaves two documents claiming the same
thing, and they rot apart.

## The first phase is a walking skeleton

Phase one builds the thinnest version that runs end to end. Real structure, no
useful work. Enough that the user can watch the whole shape move.

This exists because agreement is not correctness. A page both people are happy
with can still be wrong about the world. The mission is a hypothesis until
something runs, and the sooner it runs the less there is to unpick.

## Go and see

Read what already exists before deciding anything. The old scripts, the config
files, what is actually installed on the machine, what the last attempt left
behind.

The name is Toyota's, for the rule that you do not reason about the factory
floor from the office. You go and stand on it.

It will not match what anyone remembers. A script that has not been run in two
years, a config file nothing loads, a tool that arrived as somebody else's
dependency. Every one of those changes what should be built.

Do this early, while a discovery can still be absorbed by editing a paragraph.

## Skip questions that do not change anything

Before asking, guess the answer. If the guess is confident, state it as an
assumption and continue.

When the user asks whether an answer is obvious, say so honestly and move on.
A question that only confirms what both parties already know costs a round and
buys nothing.

## Knowing when to stop

The interview is over when answers stop changing the design, not when the
questions run out.

The signal is a run of questions where the user's answer is what you would have
written anyway.
