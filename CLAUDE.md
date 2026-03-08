# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an OpenClaw skill that collects posts from a user's X (Twitter) timeline, analyzes trends, and saves structured Markdown reports to an Obsidian vault with Slack notifications.

## Repository Structure

- `SKILL.md` — The OpenClaw skill definition (frontmatter + workflow instructions). This is the core artifact of this project.
- `sync-skill.sh` — Copies `SKILL.md` to the OpenClaw skills directory for deployment.
- `README.md` — Project documentation and installation guide.

## Deployment

OpenClaw rejects symlinks in the skills directory (see [openclaw/openclaw@c275932](https://github.com/openclaw/openclaw/commit/c275932aa4230fb7a8212fe1b9d2a18424874b3f)). The skill is deployed by copying `SKILL.md` via the sync script:

```
./sync-skill.sh          # Copy SKILL.md to ~/.openclaw/workspace/skills/
./sync-skill.sh status   # Check for differences without copying
```

Run `./sync-skill.sh` after editing `SKILL.md` to deploy changes.

## Editing SKILL.md

- The file uses YAML frontmatter (`name`, `description`) followed by Markdown workflow instructions.
- The `description` field in frontmatter is what OpenClaw uses to match user intent to this skill — keep it accurate.
- Workflow steps use OpenClaw-specific command syntax (e.g., `browser`, `exec`, `write`, `message`).
- Report templates use Japanese headings by default. The `lang` parameter controls output language.
