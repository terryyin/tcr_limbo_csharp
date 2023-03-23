#!/bin/bash

# This script will:
#
# 1. Run TCR (tests) and continue if successful.
# 2. Pull and rebase the changes from the remote repository.
# 3. If there's a merge conflict, it will inform the developer to fix it and run ./limbo.sh continue to resume the process from step 1.
# 4. Run the tests again; if they fail, it will inform the developer that changes are not pushed and tests need to be fixed, then exit.
# 5. Attempt to push the changes; if someone else pushed in between, it will retry the process from step 2.
#

function tcr() {
  dotnet test
  if [ $? -eq 0 ]; then
    git add -A
    git commit -m "TCR"
  else
    git checkout HEAD -- .
  fi
}

function pull_rebase() {
  git pull --rebase
}

function push_changes() {
  git push
}

while true; do
  tcr
  if [ $? -ne 0 ]; then
    break
  fi

  pull_rebase
  if [ $? -ne 0 ]; then
    echo "Merge conflict detected. Please resolve the conflict and then run './limbo.sh continue'."
    break
  fi

  tcr
  if [ $? -ne 0 ]; then
    echo "Tests failed after pulling changes. Please fix the tests before proceeding."
    break
  fi

  push_changes
  if [ $? -ne 0 ]; then
    echo "Failed to push changes. Another push occurred in between. Retrying the process."
    continue
  else
    break
  fi
done

