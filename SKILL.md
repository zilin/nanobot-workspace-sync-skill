# Skill: workspace-sync

## Description
Automatically synchronizes the nanobot workspace to a remote GitHub repository to backup memory, skills, and coding artifacts.

## Usage

### 1. Setup Sync
When a user asks to configure or set up workspace sync:
1. Ensure you have the target GitHub repository (e.g., `owner/repo`) and a Personal Access Token (PAT). Ask the user if missing.
2. Use the `exec` tool to configure the git repository in `/data/.nanobot/workspace`:
   ```bash
   cd /data/.nanobot/workspace
   git init
   git config user.name "nanobot"
   git config user.email "nanobot@localhost"
   git remote remove origin || true
   git remote add origin https://<TOKEN>@github.com/<REPO>.git
   git branch -M main
   ```
3. Use the `cron` tool to schedule an automatic sync (e.g., every hour / 3600 seconds) that runs the `sync.sh` script:
   ```json
   {
     "action": "add",
     "every_seconds": 3600,
     "message": "Execute /data/.nanobot/workspace/skills/workspace-sync/sync.sh to auto-sync the workspace."
   }
   ```

### 2. Manual Sync
When the user asks to "sync the workspace now":
1. Use the `exec` tool to run the sync script:
   ```bash
   /data/.nanobot/workspace/skills/workspace-sync/sync.sh
   ```
2. Report the output back to the user.
