#!/bin/bash

echo -e "Deploying updates to GitHub..."

# Build the project
hugo -t hugo-PaperMod

# Go To Public folder, sub module commit
cd public

# Add Changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
	then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin +main

# Come Back up to the Project Root
cd ..

# blog 저장소 Commit & Push
git add .

msg="rebuilding site `date`"
if [$# -eq 1 ]
	then msg="$1"
fi
git commit -m "$msg"

git push origin +main
