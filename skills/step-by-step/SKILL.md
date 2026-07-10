---
name: step-by-step
description: Work and make decisions one step at a time, asking the user before making judgment calls. Use whenever asked to work step by step, or whenever a task involves multiple reasonable approaches, tradeoffs, or decisions the user should weigh in on rather than have you guess.
---

Tackle one thing at a time. Finish it, then move on.

When a task involves a judgment call, multiple reasonable approaches, a tradeoff worth surfacing, or anything where you'd otherwise be guessing what the user wants, ask the user. Write the question as plain text, then list suggested answers as a numbered list so the user can reply with a number. Prefix the recommended option with ★ (unicode star).
Only ask when there are genuine decisions to be made. Don't ask if there's a clear best practice or the choice is obvious.
Treat verification as its own judgment call. The user may want to test now, test later, or test manually. Ask before assuming.

Decouple work where you can. If parts of the task are independent, finish one before starting the next. If they're coupled, surface all the related decisions together so the user can make them in one pass.

Treat answers as inputs. That means that even if you had multiple options lined up, the answer might change the direction of the work in a way you didn't anticipate. Be ready to re-evaluate, pivot and ask follow-up questions as needed.

## Examples

Below is a list of examples of how this skill should be used.

### Coupled work — surface decisions together

**Task:** "Refactor the auth module and update the tests."

These are coupled. Test changes follow refactor decisions, so ask about both up front.

> How should I structure the refactor?
> 1. ★ Extract a `Session` class (cleanest separation)
> 2. Keep flat functions, just rename for clarity
> 3. Something else — tell me more
>
> And how do you want to handle test verification?
> 1. ★ Run the suite after each change
> 2. Wait until the refactor is done, then run once
> 3. I'll test manually later

### Independent work — finish one, then the next

**Task:** "Add input validation to the signup form and fix the broken pagination on the users list page."

These are independent, different files, different concerns. Start with one, finish it end-to-end, then move to the next.

While working on the signup validation, a real decision comes up:

> When should validation fire?
> 1. ★ On submit (standard, less noisy)
> 2. On blur for each field (catches errors earlier)
> 3. Live as the user types (most responsive, can feel naggy)

### A custom answer that opens new decisions

You ask:
> Where should the admin warning appear when built assets are missing?
> 1. ★ On the admin dashboard only
> 2. Globally, on every page
> 3. In server logs only

The user answers: *"Global, but make sure it's removed in the deployed code."*

Don't just implement "global warning." The second clause introduces a new decision the user hasn't actually made — *how* to strip it from production. Ask:

> How should the warning be excluded from the deployed build?
> 1. ★ Wrap in a dev-only environment check (`if (import.meta.env.DEV)`)
> 2. Strip via build config (e.g., a Vite/webpack define plugin)
> 3. Use a feature flag the deploy pipeline disables