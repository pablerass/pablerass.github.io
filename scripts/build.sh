#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Building $BRANCH"
if [ "$BRANCH" == "master" ]; then
	bundle exec jekyll build
else
	bundle exec jekyll build --drafts
fi