# Phase 0 — Environment Setup

## What I did
- Installed WSL2 and Ubuntu 26.04 LTS on Windows via `wsl --install`
- Fixed a Ctrl+V paste issue by installing Windows Terminal and setting Ubuntu as the default profile
- Connected VS Code to my Ubuntu environment using the WSL extension (had to explicitly "Reopen Folder in WSL" to confirm it wasn't editing through the slow Windows bridge)
- Initialized Git, set global username/email, made my first commit
- Set up this repo (`linux-bash-mastery-log`) to document the whole curriculum

## What I learned

**Kernel / Shell / Terminal / CLI**
The kernel talks to hardware and manages processes. The shell (Bash) interprets what I type and tells the kernel what to do. The terminal is just the window I'm looking at. CLI is the general term for "using commands instead of clicking."

**Linux and Windows are two separate filesystems**
WSL gives me access to my Windows files through `/mnt/c/...`, but my real Linux home directory (`/home/sola/...`) is completely separate. Projects should live in `/home/sola/`, not `/mnt/c/`, because:
- Git and other tools need to set Linux-style permissions (`chmod`), which NTFS (the Windows filesystem) doesn't support properly — this caused a `git init` error I had to debug
- Performance is much better on native Linux storage

**Git basics**
- `git init` starts tracking a folder
- Git only tracks files, not empty folders — I decided not to use `.gitkeep` placeholders yet since I'm about to fill these folders with real content
- `git config --global` sets identity/settings for every repo on the machine, not just one
- `git log --oneline` shows commit history in short form

## Mistakes I made (and why they happened)
- Tried running Linux commands in Command Prompt before WSL was even installed — Command Prompt and Bash are completely different shells
- Ran `git init` inside `/mnt/c/...` and got a permissions error, because NTFS doesn't support Linux-style `chmod`

## Still to explore
- Filesystem hierarchy (Phase 1)
- Users, groups, permissions in depth
- Processes