# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an OpenClaw skill that collects posts from a user's X (Twitter) timeline, analyzes trends, and saves structured Markdown reports to an Obsidian vault with Slack notifications.

## Repository Structure

- `SKILL.md` — The OpenClaw skill definition (frontmatter + workflow instructions). This is the core artifact of this project. It is symlinked from `~/.openclaw/workspace/skills/x-timeline-reporter/SKILL.md` so OpenClaw can discover it.
- `README.md` — Project documentation and installation guide.

## Deployment

The skill is deployed by symlinking `SKILL.md` into the OpenClaw skills directory:

```
~/.openclaw/workspace/skills/x-timeline-reporter/SKILL.md -> <repo>/SKILL.md
```

Changes to `SKILL.md` in this repo take effect immediately in OpenClaw via the symlink.

## Editing SKILL.md

- The file uses YAML frontmatter (`name`, `description`) followed by Markdown workflow instructions.
- The `description` field in frontmatter is what OpenClaw uses to match user intent to this skill — keep it accurate.
- Workflow steps use OpenClaw-specific command syntax (e.g., `browser`, `exec`, `write`, `message`).
- Report templates use Japanese headings by default. The `lang` parameter controls output language.
