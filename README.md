# X Timeline Reporter for OpenClaw

An [OpenClaw](https://openclaw.ai) skill that collects posts from your X (Twitter) timeline, analyzes trends, saves structured reports to an Obsidian vault, and sends a summary notification via Slack.

## What It Does

1. Opens X timeline using OpenClaw's managed browser
2. Collects posts (content, authors, engagement metrics, URLs)
3. Analyzes trends — key topics, tech trends, sentiment, notable posts
4. Saves a formatted Markdown report to your Obsidian vault
5. Sends a brief Slack notification with highlights

## Prerequisites

- [OpenClaw](https://openclaw.ai) installed and configured
- Managed browser profile with an active X login session
- Obsidian vault with an `x-reports` folder
- Slack channel configured in OpenClaw

## Installation

Clone this repository and symlink `SKILL.md` into your OpenClaw skills directory:

```sh
git clone https://github.com/<your-user>/x-timeline-reporter.git
mkdir -p ~/.openclaw/workspace/skills/x-timeline-reporter
ln -s "$(pwd)/x-timeline-reporter/SKILL.md" \
  ~/.openclaw/workspace/skills/x-timeline-reporter/SKILL.md
```

OpenClaw will automatically pick up the skill from the skills directory.

## Usage

Trigger the skill by asking OpenClaw in natural language:

- "Check my X timeline and report"
- "X Timeline Report を作成して"
- "Xのタイムラインをチェックしてレポートして"
- "Twitterのトレンドを分析して"

### Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `count`   | 10      | Number of posts to collect (max: 30) |
| `lang`    | ja      | Report language (`ja` / `en`) |
| `dry-run` | false   | Preview report without saving or notifying |

## Report Output

Reports are saved to your Obsidian vault at `x-reports/YYYY-MM-DD_HHMM.md` and include:

- **Post summaries** — full list with engagement metrics and links
- **Trend analysis** — key topics, tech trends, emerging discussions
- **Engagement analysis** — top posts by views and engagement rate
- **Sentiment overview**
- **Action items** — suggested follow-ups

## License

MIT
