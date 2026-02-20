#!/bin/bash
# sync.sh - Script to automatically commit and push workspace changes
cd /data/.nanobot/workspace

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Error: Git is not initialized in the workspace."
    exit 1
fi

# Add all changes
git add .

# Check if there are changes to commit
if ! git diff-index --quiet HEAD --; then
    timestamp=$(date +'%Y-%m-%d %H:%M:%S')
    git commit -m "Auto-sync workspace: $timestamp"
    git push origin main
    echo "Workspace synced successfully at $timestamp."
else
    echo "No changes to sync."
fi
