# App Server Maintenance — Phase 3 Practical Assessment

Simulates preparing a fresh app environment, generating activity logs,
archiving and cleaning them up, and setting up a limited-access monitoring
account — the kind of task a junior DevOps engineer would handle when
onboarding a new server and a new teammate.

## What was done

1. Created `logs/` and `data/` directories for a simulated app environment.
2. Generated 15 activity log files using a Bash loop, simulating real
   application traffic over time.
3. Counted and measured the logs before archiving, to have a baseline.
4. Archived all logs into a compressed, date-stamped `.tar.gz` file.
5. Verified the archive existed and had a real, non-zero size *before*
   deleting the original log files — never delete before confirming a
   backup is actually valid.
6. Created a `log-monitors` group and a `monitor1` user, then added
   `monitor1` to that group using `usermod -aG` (append, not replace) —
   giving them exactly the access needed without granting broader
   permissions.

## Real-world relevance

- **Archive-before-delete** protects historical data needed for debugging
  or compliance, while still freeing disk space.
- **Least-privilege user/group setup** means a teammate who only needs to
  monitor logs never has more access than that — reducing security risk.
- **Verifying before destructive actions** (checking archive size before
  deleting originals) is a habit that prevents real data loss.

## Mistake caught during this assessment
Re-ran the `tar` command from inside the `logs/` folder itself by mistake,
which failed but still left a corrupted, incomplete archive behind before
erroring out. This was a good reminder that a failed command can still
produce partial output — always verify results rather than assuming an
error means nothing happened.