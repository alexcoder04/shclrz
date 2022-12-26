#!/bin/sh

# check for unstaged changes
if [ ! -z "$(git status -s)" ]; then
  echo "You have unstaged changes, please commit them first"
  exit 1
fi

# get current version
TAG_NAME="v$(grep -E '^_shclrz_version=.*$' ./shclrz | cut -d "=" -f2 | tr -d '"' )"

# check if this version already exists
if git tag | grep -qE "^$TAG_NAME\$"; then
  echo "The tag $TAG_NAME already exists"
  exit 1
fi

# create new tag
git tag "$TAG_NAME"

# push everything, pushing the tags will trigger release generation on github
git push
git push --tags
