@echo off

if "%1" equ "ghq" (
  goto ghq
)

if "%1" equ "history" (
  if "%2" equ "" (
    goto history
  )
  if "%2" equ "clip" (
    goto historyclip
  )
)

goto end

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

:historyclip
for /f "tokens=*" %%x in ('tac %CMDER_ROOT%/config/.history ^| peco') do (
  set /P ="%%x"< nul | clip
  break
)
goto end

:end
