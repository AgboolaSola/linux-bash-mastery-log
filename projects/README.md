# Server Audit — Phase 1 Practical Assessment

Simulates a basic audit a junior DevOps engineer would perform after
gaining access to a new Linux server, before being trusted with more.

## Files

**`filesystem-report.txt`**
Confirms current working directory and home directory. A DevOps engineer
checks this first to understand where they are and where user data lives
on an unfamiliar machine — critical before running any command that
touches files.

**`permissions-report.txt`**
Documents the permission lockdown on `secrets.env` (`600` — owner
read/write only, nothing for group/others) and confirms an environment
variable (`SERVER_ROLE`) was properly exported, not just set locally.
Matters because sensitive files (credentials, `.env` configs) must never
be readable by other users on a shared system, and unexported variables
silently fail to reach child processes/scripts.

**`services-report.txt`**
Captures the live status of the `cron` service via `systemctl status`,
plus a snapshot of a manually created background process (`sleep 60`)
found via `ps aux` and terminated with `kill`. Demonstrates the
difference between a systemd-managed service (survives independent of
any login session, auto-restarts on failure) and a bare backgrounded
process (`&`), which dies when its terminal session ends.

## What this demonstrates
- Filesystem navigation (absolute vs relative paths)
- Permission management (`chmod`, least privilege)
- Environment variables and

## Phase 2 Additions

**`human-users.txt`** — real human user accounts (UID ≥ 1000) extracted from
`/etc/passwd`, filtering out system/service accounts. Relevant for security
audits and onboarding/offboarding checks on a real server.

**`disk-report.txt`** — root filesystem disk usage snapshot. First thing to
check when a "disk full" alert comes in.

**`process-ranking.txt`** — count of running processes grouped by owning
user, useful for spotting which account is consuming the most resources or
behaving unexpectedly.