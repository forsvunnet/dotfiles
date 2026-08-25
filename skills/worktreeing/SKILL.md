---
name: worktreeing
description: "Move the session into a git worktree and work there, so the main checkout stays free. Use when the user says worktree, or asks to work on something while the project is busy."
---
Work in a worktree so the main checkout stays free for a running server, a test run, or another branch.

## Enter

Call `EnterWorktree` with a short name for the task. It makes the worktree, makes the branch, and moves the session into it.

The base ref is `origin/<default-branch>`. To start from the current local HEAD instead, set `worktree.baseRef` to `head` in settings, or ask the user first.

## Plan

Run the `working` skill and agree the plan with the user before you write any code.

Skip this only when the user already agreed a plan in this session.

## Commit and push

Commit at each logical group of work. A group is one change that stands on its own. A group can cover several outline steps, and one outline step can hold several groups.

Push after each commit.

Use the `commit` skill if the project has one.

## Arguments

`no-commit`: write the code, commit nothing. This also stops the push.

`no-push`: commit as normal, push nothing.

## Leave

Call `ExitWorktree` only when the user asks to leave.

Ask the user to pick `keep` or `remove` first. Pick nothing for them.
