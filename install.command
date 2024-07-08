#!/bin/bash

# URL of the repository to clone
REPO_URL="https://github.com/DanielChristopherMcClure/vandycraft.git"

# Temporary directory to clone the repository into
TEMP_DIR=$(mktemp -d)

# Clone the repository into the temporary directory
git clone "$REPO_URL" "$TEMP_DIR"

# Move the contents of the temporary directory to the current directory
mv "$TEMP_DIR"/* "$TEMP_DIR"/.[!.]* . 2>/dev/null

# Remove the temporary directory
rm -rf "$TEMP_DIR"

echo "Repository has been successfully cloned into the current directory."



exit 0