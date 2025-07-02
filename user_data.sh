#!/usr/bin/env bash

# If you would like to change the scan's username, you can do so by un-commenting & hard-coding it here.
# echo BUILD_USER $USER

# Creates a Tag called "DEMO"
echo SCAN_TAG_DEMO ""

# Tag as "Dirty" if there are modifications
if [ -z "$(git status --porcelain)" ]; then
  echo SCAN_TAG_CLEAN ""
else
  echo SCAN_TAG_DIRTY ""
fi

# Creates Links in the Build Scan
echo SCAN_LINK_Bazel_Docs https://bazel.build/docs
echo SCAN_LINK_Bazel_Reference https://bazel.build/reference
echo SCAN_LINK_Develocity https://gradle.com/develocity/

# Creates a Scan Key/Value
echo SCAN_VALUE_Day_of_the_week $(date +%w)
echo SCAN_VALUE_GIT_COMMIT_ID $(git rev-parse HEAD)
echo SCAN_VALUE_GIT_BRANCH $(git branch --show-current)
