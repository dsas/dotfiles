---
name: commit-messages-general
description: Guide for writing good git commit messages. Use when crafting commit messages and no project-specific commit message guidelines exist. Do not use if the project has its own commit skill or CLAUDE.md commit instructions.
---

# Skill: Write Good Git Commit Messages

## Overview
This skill helps craft clear, informative git commit messages. Good commit messages communicate *what* changed and *why* — because the diff already shows *how*.

---

## Commit Message Structure

```
<scope>: <subject line - imperative, max 50 chars>

<body - wrap at 72 chars>
Explain WHY this change was made, not just what.
Include context about the problem and its consequences.

<footer>
Refs: #ticket-number
Props: @contributor
```

---

## Core Principles (from Automattic Field Guide)

### 1. **Always include a subject line**
- One sentence, brief description of the change
- Include *why* if not obvious
- **Use imperative mood** ("Add", "Fix", "Remove" — not "Added", "Fixes")
- **Don't end with a period**
- Limit to ~50 characters (72 max)

### 2. **Tell WHY, not just WHAT**
The diff shows what changed. Your message explains:
- Why was this change necessary?
- What problem did it solve?
- What were the consequences of the bug?

Use the **5 Whys technique** — go one level deeper than obvious.

### 3. **Explain the cause and consequences of bugs**
When fixing issues:
- What caused the problem?
- What were its consequences?
- How might someone avoid similar issues?

### 4. **Explain HOW only when non-obvious**
Most implementations are self-explanatory from code. Only include high-level algorithm explanations when they save significant reader effort.

### 5. **Keep commits atomic**
If your subject line contains "and" or lists multiple items consider splitting it.
- Fix one thing per commit
- Whitespace changes = separate commit
- Noticed another bug? Make a note, fix it separately.

### 6. **Don't substitute links for explanations**
Links are footnotes, not the message itself. Include:
- A sentence of explanation
- Brief summary of referenced discussions
- Direct quotes of key points (links may break!)

### 7. **Reference tickets and give props**
```
Fixes: #12345
Props: @username
See also: [related discussion link]
```

---

## The Imperative Test

> **"If applied, this commit will..."** *[your subject line]*

✅ "If applied, this commit will **Add validation to checkout form**"
✅ "If applied, this commit will **Remove deprecated API endpoints**"
❌ "If applied, this commit will ~~Fixed the bug~~"
❌ "If applied, this commit will ~~Adding new feature~~"

---

## Examples

### ✅ Good: Simple fix with context
```
stats: Use double quotes for variable interpolation

Single quotes were preventing variable expansion in the stats
link URL on m.wordpress.com.

Introduced in the mass sanitization of [46532].
```

### ✅ Good: Refactor with reasoning
```
api: Split class into hierarchy for Jetpack inclusion

Including the old code required a bunch of hacks and compatibility
layers. With the new hierarchy, we can drop in the files to Jetpack
as-is without modification.

Refs: p1234567890
```

### ✅ Good: Feature removal with UX rationale
```
reports: Remove filtering by ticket

The ticket filter was slow to generate and rarely used. The typical
workflow is to visit the ticket page directly and see associated
comments there.

Props: @designer-who-suggested-this
```

### ✅ Good: Bug fix with cause explanation
```
signup: Sort domains by length for correct dropdown selection

When entering "baba.mlblogs.com", the smartness code was setting
blogname to "baba.mlblogs" and domain to ".com" because .com
appeared before .mlblogs.com in the domain list.

Sorting domains by length ensures longer suffixes are checked first,
preventing partial matches.
```

### ❌ Bad examples
```
fixed stuff                    # Vague, past tense
Updates.                       # Trailing period, no context
Tweaked a few things           # What things? Why?
WIP                            # Not ready to commit
asdfasdf                       # Just... no
```

---

## Quick Checklist

- [ ] Subject line is imperative ("Add" not "Added")
- [ ] Subject ≤50 chars, no trailing period
- [ ] Blank line between subject and body
- [ ] Body wrapped at 72 characters
- [ ] Explains WHY, not just what
- [ ] Commit is atomic (one logical change)
- [ ] Links have summaries (not link-only explanations)
- [ ] References ticket numbers where applicable
- [ ] Props given to collaborators

---

## Pro Tips

1. **Spend time on your message** — It's OK to spend more time writing the commit message than the code itself.

2. **Message can be longer than the diff** — A one-line fix might need several paragraphs of context.

3. **Take a break first** — Writing prose requires a different mindset than coding. Step away, then write.

4. **Use `git commit --amend`** — Fix your most recent message if you notice issues.

5. **Prefix with project name** when working in clearly-defined project spaces:
   ```
   JSON API: Add endpoint for user preferences
   VIP Report: Clear caches on each post to save memory
   ```

---

## References
https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
