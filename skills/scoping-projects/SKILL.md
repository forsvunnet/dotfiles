---
name: scoping-projects
description: Interview the user into a written mission statement, style guide and build phases before any code exists. Use when starting a new project or sub-project, when a request is bigger than a single change, or when the user asks to agree on what something is before building it.
---

Nothing gets built until the project is described in files the user has read and
agreed to.

## The artifacts

Three documents, produced in this order, each one settling the vocabulary the
next one argues in.

**The mission statement.** What the thing is, who it is for, what it refuses to
do. One page. If it does not fit on a page, the project is not understood yet.

**The style guide.** How the code is written. Layout, data shapes, naming,
error handling, what a new contributor has to copy. Written after the shape of
the thing is settled and before any of it exists.

**The phases.** What order it gets built in, and why that order. Which phase
first makes the thing prove itself end to end.

Commit all three before writing code. They are the first deliverable, not a
preamble to it.

## Look at the real system before deciding anything

Read what already exists. The old scripts, the config files, what is actually
installed on the machine, what the last attempt left behind.

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
