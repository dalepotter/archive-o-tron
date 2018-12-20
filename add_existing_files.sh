#!/usr/bin/env bash
set -x # Turn echo on

PUBLICATION_BRANCH=gh-pages
git clone --branch=$PUBLICATION_BRANCH https://${GITHUB_TOKEN}@github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG-$PUBLICATION_BRANCH 2>&1 > /dev/null
cp -r $TRAVIS_REPO_SLUG-$PUBLICATION_BRANCH/* docs/
