#!/bin/bash

# Function to check if the current directory is a git repository
function is_git_repo() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

# Check if the current directory is a git repository
if is_git_repo; then
    echo "Syncing the current directory with its checked-out repository..."

    # Reset the current branch to the latest commit from the remote repository, discarding local changes
    git fetch origin
    git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)

    # Clean untracked files and directories
    git clean -fd

    echo "Directory has been successfully synced and all changes have been discarded."
else
    echo "Error: The current directory is not a git repository."
    exit 1
fi
