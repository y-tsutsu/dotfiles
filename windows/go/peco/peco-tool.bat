@echo off

if "%1" equ "ghq" (
  goto ghq
)

if "%1" equ "history" (
  goto history
)

:ghq
for /f "tokens=*" %%x in ('ghq list -p ^| peco') do (
  cd %%x
  break
)
goto end

:history
for /f "tokens=*" %%x in ('tac %CMDER_ROOT%/config/.history ^| peco') do (
  %%x
  break
)
goto end

:end
