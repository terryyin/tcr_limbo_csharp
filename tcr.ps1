$ErrorActionPreference = "Stop"

try {
    dotnet test

    git add -A
    git commit -m "TCR: WIP"
} catch {
    git restore --staged .
    git restore .
}

