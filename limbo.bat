@echo off

:begin
call :tcr
if %errorlevel% neq 0 goto :eof

call :pull_rebase
if %errorlevel% neq 0 (
  echo Merge conflict detected. Please resolve the conflict and then run "limbo.bat continue".
  exit /b 1
)

call :tcr
if %errorlevel% neq 0 (
  echo Tests failed after pulling changes. Please fix the tests before proceeding.
  exit /b 1
)

call :push_changes
if %errorlevel% neq 0 (
  echo Failed to push changes. Another push occurred in between. Retrying the process.
  goto begin
)

exit /b 0

:tcr
dotnet test
if %errorlevel% equ 0 (
  git add -A
  git commit -m "TCR"
) else (
  git checkout HEAD -- .
)
exit /b %errorlevel%

:pull_rebase
git pull --rebase
exit /b %errorlevel%

:push_changes
git push
exit /b %errorlevel%

