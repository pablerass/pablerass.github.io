#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" == "master" ]; then
	bundle exec jekyll serve
else
	bundle exec jekyll serve --drafts
fi