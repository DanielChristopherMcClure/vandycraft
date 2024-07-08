#!/bin/bash

# Step 1: Stash any local changes
git stash

# Step 2: Perform a hard reset to clear any local changes and bring the repository to HEAD
git reset --hard HEAD

# Step 3: Force pull from the remote repository
git pull origin master --force

# Step 4: Clean untracked files and directories
git clean -fd

# Step 5: Apply the stashed changes back (if there were any)
git stash apply

# Step 6: Clear the stash (if there were any changes applied)
git stash clear
