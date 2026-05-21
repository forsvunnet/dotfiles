---
name: step-by-step
description: Work and make decisions one step at a time, asking the user before making judgment calls. Use whenever asked to work step by step, or whenever a task involves multiple reasonable approaches, tradeoffs, or decisions the user should weigh in on rather than have you guess.
---

Tackle one thing at a time. Finish it, then move on.

When a task involves a judgment call, multiple reasonable approaches, a tradeoff worth surfacing, or anything where you'd otherwise be guessing what the user wants, use the `AskUserQuestion` tool. Prefix recommended options with ★.

Treat verification as its own judgment call. The user may want to test now, test later, or test manually. Ask before assuming.

Decouple work where you can. If parts of the task are independent, finish one before starting the next. If they're coupled, surface all the related decisions together so the user can make them in one pass.

Treat answers as inputs, not endpoints. If the user picks a listed option cleanly, proceed. If they write a custom answer, edit a chosen option, or accept with conditions ("yes, but..."), re-read it for new decisions hiding inside. A custom answer often *replaces* one decision with several — surface those before continuing, don't paper over them with assumptions.

## Examples

Below is a list of examples of how this skill should be used.

### Coupled work — surface decisions together

**Task:** "Refactor the auth module and update the tests."

These are coupled. Test changes follow refactor decisions, so ask about both up front.

> Use `AskUserQuestion`:
> 1. How should I structure the refactor?
>    - ★ Extract a `Session` class (cleanest separation)
>    - Keep flat functions, just rename for clarity
>    - Something else — tell me more
> 2. How do you want to handle test verification?
>    - ★ Run the suite after each change
>    - Wait until the refactor is done, then run once
>    - I'll test manually later

### Independent work — finish one, then the next

**Task:** "Add input validation to the signup form and fix the broken pagination on the users list page."

These are independent, different files, different concerns. Start with one, finish it end-to-end, then move to the next.

While working on the signup validation, a real decision comes up:

> Use `AskUserQuestion`:
> When should validation fire?
> - ★ On submit (standard, less noisy)
> - On blur for each field (catches errors earlier)
> - Live as the user types (most responsive, can feel naggy)

### A custom answer that opens new decisions

You ask:
> Where should the admin warning appear when built assets are missing?
> - ★ On the admin dashboard only
> - Globally, on every page
> - In server logs only

The user answers: *"Global, but make sure it's removed in the deployed code."*

Don't just implement "global warning." The second clause introduces a new decision the user hasn't actually made — *how* to strip it from production. Ask:

> Use `AskUserQuestion`:
> How should the warning be excluded from the deployed build?
> - ★ Wrap in a dev-only environment check (`if (import.meta.env.DEV)`)
> - Strip via build config (e.g., a Vite/webpack define plugin)
> - Use a feature flag the deploy pipeline disables