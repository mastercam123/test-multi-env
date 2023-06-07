#!/bin/bash
set -e

if [[ $(git describe --tags --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`) ]]; then
    echo "There are previous version"
else
    echo "No tags exist previously in this repository."
    echo "This is first tag in the repository."
    echo "The first tag is compared with the first commit in the branch."
    echo "prev_tag=$(git rev-list --max-parents=0 HEAD)" >> $GITHUB_OUTPUT
fi
