#!/bin/bash

# Ensure the repository is initialized
if [ ! -d ".git" ]; then
    git init
    echo "Initialized an empty Git repository."
fi

# Example: Adding multiple commits with custom dates
declare -A commits=(
    ["2023-01-01"]="First commit of the year"
    ["2023-02-14"]="Valentine's Day commit"
    ["2023-03-17"]="St. Patrick's Day commit"
)

# Loop through the array and create commits
for date in "${!commits[@]}"; do
    # Update the README.md (or create it if it doesn't exist)
    echo "${commits[$date]} on $date" >> README.md

    # Stage the changes
    git add README.md

    # Create the commit with custom date
    GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" \
    git commit -m "${commits[$date]}"
done

echo "Commits created with custom dates."
