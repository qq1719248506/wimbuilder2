rem built-in network drivers
if not "x%opt[network.builtin_drivers]%"=="xtrue" goto :EOF

set AddFiles_Mode=merge

call :NETDRIVERS_%WB_PE_ARCH%
goto :END_NETDRIVERS

:NETDRIVERS_x64
call AddDrivers "athw8x.inf,netathr10x.inf,netathrx.inf,netbc63a.inf"
call AddDrivers "netwbw02.inf,netwew00.inf,netwew01.inf,netwlv64.inf,netwns64.inf,netwsw00.inf,netwtw04.inf"

if %VER[3]% GTR 17700 (
  call AddDrivers "netwtw02,netwtn06.inf"
)
goto :EOF

:NETDRIVERS_x86
call AddDrivers "athw8.inf,netathr.inf,netathr10.inf,netbc63.inf"
call AddDrivers "netwbn02.inf,netwen00.inf,netwen01.inf,netwlv32.inf,netwns32.inf,netwsn00.inf,netwtn04.inf"

if %VER[3]% GTR 17700 (
  call AddDrivers netwtn02.inf
)
goto :EOF

:END_NETDRIVERS

call AddFiles %0 :end_files
goto :end_files

@\Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\
;built-in network drivers
Microsoft-Windows-Client-Drivers-drivers-Package~*.cat
Microsoft-Windows-Client-Drivers-net-Package~*.cat
Microsoft-Windows-Client-Drivers-Package~*.cat
Microsoft-Windows-Client-Drivers-Package-net~*.cat
Microsoft-Windows-Desktop-Shared-Drivers-*.cat
Microsoft-Client-Features-Classic-WOW64-*.cat
:end_files

call DoAddFiles