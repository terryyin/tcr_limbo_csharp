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
  # Run tests and return their status
  dotnet test
  return $?
}

function pull_rebase() {
  # Pull and rebase changes from the remote repository
  git pull --rebase
}

function push_changes() {
  # Push changes to the remote repository
  git push
}

function handle_conflict() {
  echo "Merge conflict detected. Please resolve the conflict and then run './limbo.sh continue'."
}

function handle_test_fail() {
  echo "Tests failed after pulling changes. Please fix the tests before proceeding."
}

function handle_push_error() {
  echo "Failed to push changes. Another push occurred in between. Retrying the process."
}

if [ "$1" == "continue" ]; then
  tcr
  if [ $? -eq 0 ]; then
    pull_rebase
    if [ $? -eq 0 ]; then
      tcr
      if [ $? -eq 0 ]; then
        push_changes || handle_push_error && exit 0
      else
        handle_test_fail
        exit 1
      fi
    else
      handle_conflict
      exit 1
    fi
  else
    exit 1
  fi
else
  tcr
  if [ $? -eq 0 ]; then
    pull_rebase
    if [ $? -eq 0 ]; then
      tcr
      if [ $? -eq 0 ]; then
        push_changes || handle_push_error && exit 0
      else
        handle_test_fail
        exit 1
      fi
    else
      handle_conflict
      exit 1
    fi
  else
    exit 1
  fi
fi

