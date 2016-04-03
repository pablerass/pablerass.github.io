#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" == "master" ]; then
	bundle exec jekyll build
else
	bundle exec jekyll build --drafts
fi