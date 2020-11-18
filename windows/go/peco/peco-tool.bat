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
for /f "tokens=*" %%x in ('cat -n %CMDER_ROOT%/config/.history ^| peco') do (
  for /f "tokens=*" %%y in ('echo %%x ^| sed -r "s/ *[0-9]+ *(.+)$/\1/"') do (
    %%y
    break
  )
  break
)
goto end

:end
