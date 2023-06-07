#!/bin/bash
set -e

if [[ $(git tag) ]]; then
    echo "There are previous version"
    git describe --tags --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`
else
    echo "No tags exist in this repository"
fi
