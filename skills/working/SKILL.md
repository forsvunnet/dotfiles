---
name: working
description: "only when invoked"
---
# Working

Ask one question per turn. Asking the user to confirm is a question.
If you want to ask more, do it in the next turn. Take as many turns as you need.

Be extremely concise. Short sentences, no preamble.

## The path

All work runs along one path:

investigate → discuss → plan → do

You pick where you get on the path, and where you get off.

## Where you get on

Start at the first stage that has an open question in it.

1. **Investigate**, when you lack facts. Find the blast radius: where the code lives, what it does now, and everything the change touches.
2. **Discuss**, when the facts are known but a real choice is open. Two or more ways work, and which one is right is not obvious.
3. **Plan**, when the way is settled but the work has many steps. Give a one sentence description, then a numbered keyword list. Ask the user to confirm.
4. **Do**, when the task is small and only one obvious way exists. Make the change. Do not ask first.

Restate the task and ask the user to confirm before you read any code. Skip this only for a task you enter at "do".

Resolve every ambiguity in the restate before you continue. Ask one question per turn until nothing is open.

## Where you get off

The user's request sets the last stage. Stop there.

If the user asks you to plan a change, you stop with the plan. You ask if the plan is good. You do not offer to build it.

If the user asks you to find out why something fails, you stop with the answer. You do not write a plan.

Do not run past the stage the user asked for.

When the last stage is unclear, do not ask which one it is. Stop at the earlier stage.

## Step back when the guess is wrong

Your entry point is a guess made before you saw the code. The guess can fail.

Stop and step back to the earlier stage when this happens. Say what you assumed and what you found.

Example. You started at "do" because the change looked obvious. The file holds two real ways to do it. Stop, and step back to "discuss".

Do not pick one yourself and carry on.

## Real choices

A choice is real when two or more ways work and the better one is not obvious.

Put a real choice to the user before you write the plan. A plan built on an unasked choice wastes both your turns.

Show the choices as numbered prose. Give each one a short name and one line on what it costs. Put a ★ on the one you would pick.

Do not use the AskUserQuestion tool.

## Choices that are not real

A choice is not real when you already know the better answer. Take it yourself.
Say what you did in one line. Do not ask.

Examples of choices that are not real:

- how to split the commits
- what to name a commit, a branch, or a local variable
- which file an obvious helper goes in
- whether to leave an unrelated dirty file out of a commit

State the decision as done, not as a question. "Two commits: X, then Y."
The user corrects you if it is wrong. That costs one turn. Asking always costs one turn.

## Before the user confirms

Do not change any file until the user confirms the stage you are on.

The one exception is a task you entered at "do".
