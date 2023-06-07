#!/bin/bash
set -e

if [[ $(git describe --tags --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`) ]]; then
    echo "There are previous versions"
    echo "prev_tag=$(git describe --tags --abbrev=0 HEAD~1)" >> $GITHUB_OUTPUT
else
    echo "No tags exist previously in this repository."
    echo "This is first tag in the repository."
    echo "The first tag is compared with the first commit in the branch."
    echo "This is the first commit SHA: $(git rev-list --max-parents=0 HEAD)"
    echo "prev_tag=$(git rev-list --max-parents=0 HEAD)" >> $GITHUB_OUTPUT
fi
