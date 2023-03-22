#!/bin/bash
set -e

function cleanup {
    git restore --staged .
    git restore .
}

trap cleanup ERR

dotnet test

git add -A
git commit -m "TCR: WIP"

