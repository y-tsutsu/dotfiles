@echo off

set history=%CMDER_ROOT%/vendor/clink/clink history

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
for /f "tokens=*" %%x in ('call %history% ^| tac ^| peco') do (
  for /f "tokens=*" %%y in ('echo %%x ^| sed -e "s/^ *[0-9]\+ \+\(.\+\)$/\1/g" ^| sed "s/\s*$//"') do (
    %%y
    break
  )
)
goto end

:historyclip
for /f "tokens=*" %%x in ('call %history% ^| tac ^| peco') do (
  for /f "tokens=*" %%y in ('echo %%x ^| sed -e "s/^ *[0-9]\+ \+\(.\+\)$/\1/g" ^| sed "s/\s*$//"') do (
    set /P ="%%y"< nul | clip
    break
  )
)
goto end

:end
