@echo off
REM -------------------------------------
REM ||/\- Last Logon retrieval tool -/\||
REM ||/\-  Jon Searles - 04/01/2015 -/\||
REM -------------------------------------
REM [~~~Powered By: Command Injection~~~}
goto title

:title
echo.
echo Last Logon Time Retrieval Tool V0.0.1
echo Written by Jonathan Searles 
echo Last Updated 04/01/2015
echo.
goto checkvariable

:checkvariable
if "%1" == "" (
echo You must specify an account name!
echo Syntax: lastlogon ^<username^>
echo.
goto end
) else (
goto initialize
)

:initialize
IF EXIST %TEMP%\45929temp del %TEMP%\45929temp
set comp=0
goto getlogontime

:getlogontime
for /F usebackq %%f in (`dsquery server ^| dsget server -dnsname`) do dsquery * -filter (sAMAccountName=%1) -attr lastlogon -s %%f 2>nul | find "1" >> %TEMP%\45929temp 
goto findrecent

:findrecent
for /F usebackq %%g in (`SORT %TEMP%\45929temp`) do set comp=%%g
goto decodetime

:decodetime
echo The last logon time for %1 is:
w32tm /ntte %comp%
echo.
goto cleanup

:cleanup
IF EXIST %TEMP%\45929temp del %TEMP%\45929temp
pause
goto egg


:egg
IF %random% GTR 30000 (PROMPT ^\^\l5x.intelcollector.fbi.gov^\Top Secret^\ %^>
goto unicorn
)
IF %random% LSS 5000 (
PROMPT Are you sure you want to delete C:\*.*? [Y/n] 
goto nobull
)
goto end

:nobull 
echo 	                        ....+((zzz((-....
echo                       ..+6llllllllllllllllllllZz+.
echo                   .-OllllllltllllllltllllllllllllllOi.
echo                .JOllllllllllllltllllltltlltlllllllllllOI.
echo             ..6lllllltlltlOt?=!~         !?7^>OOllllllllllwi.
echo           .(OlllllllllOv7`                      ?1ylltlllllO6.
echo          .OlllllllltO=                             ?COlllllllOn.
echo        .Sllllllltlln.                                 7ylllllllv+
echo       .Olllltlllllllvi                                  ?slltllltn
echo      Jllltlllltlltllllvi                                  TOllllllG.
echo     Jlllllltu= TOlllllllZ^>            .                  c .sltllllw.
echo    .lltllltv`   .4OlllllllZ^>          (                  b  .kllltllG
echo   .OlllltOr       .1OlltllllZ........ M                  M    SllllllL
echo   Dllllltr          .1Olltllll1TMMMMM.Mx.      ..........M    .ylltlld.
echo  .llltllJ             .2llllllllidMMMN.YMMMMMMMMMMMMMMMM"'     .OlltllL
echo  Klllllu\           .JMMmvltlllllliTMMMN^&x MMMMMMMMMM           Sllllld
echo .6ltllld           .MMMMMMmvtlltlllliTMMM] HMMMMMMMM]           .lltllt]
echo .llltll]          .MMMMMMMMMmzlllllllliTM] .MMMMMMMM`           .llllll]
echo .llllll]      x  .MMMMMMMMMMMMm1lltlllllzb  (MMMMMM]            .lltlll]
echo .ltlltl]      b  MMMMMMMMMMMMMMMm1llllllllI. 4MMMM#             .llltll]
echo .ylllllG      M .MMMMMMMMMMMMMMMMMm1lltlllll6.TMMD              .lllllt]
echo  Kllltld      M  MMMMMMMMMMMMMMMMMMMg1llltlllt6.                Dtlllld
echo  jllllll]     (MgMMMMMMMMMMMMMMMMMMMMMg1llllllll6.             .llltll2
echo  .kltlltd.      .!"MMMMMMMMMMF????????TMe1lltllllt6.          .Olllltd^
echo   .lllllld.         "MMMMMMMMM         MM]?ylltllllO6.       .Iltllllr
echo    4lltlllw.           .!""MMM         MM]  7ylltllllOn.    .OlllltlJ
echo     Slllllld.     .MMa.    MMM         MM]    7slllllllOn..Ollllllld`
echo      4ltllllOn   (MMMMM    ?MM         TM]      7yltlllllllllltlltv`
echo       4tlltlllZ^> .WMM#^      ?           `        7ylllllllltllltv
echo        ?slllllllZ^>.                                 4lllltlllllu=
echo          TOlltllllOI.                             .vlltlllltlOv!
echo           .1OllllllllOI..                      .JOllllltllltv'
echo              TylltlltllllOz^>...          ...zIlllllltllllOv'
echo                ?1OlllllllllllllltOOOOOtlltllllllllllllty=`
echo                   ?1ylltlllllllllllllllllltlllltltlOv7`
echo                       ?7lOlltlllllllltlllllltlOy?7`
echo                             `?7^>^>llllzz^>+7=?~
pause 
goto end

:unicorn
echo                                                    /
echo                                                  .7
echo                                       \       , //
echo                                       ^|\.--._/^|//
echo                                      /\ ) ) ).'/
echo                                     /(  \  // /
echo                                    /(   J`((_/ \
echo       You found a Unicorn!        / ) ^| _\     /
echo                                  /^|)  \  eJ    L
echo                                 ^|  \ L \   L   L
echo                                /  \  J  `. J   L
echo                                ^|  )   L   \/   \
echo                               /  \    J   (\   /
echo             _....___         ^|  \      \   \```
echo      ,.._.-'        '''--...-^|^|\     -. \   \
echo    .'.=.'                    `         `.\ [ Y
echo   /   /                                  \]  J
echo  Y / Y                                    Y   L
echo  ^| ^| ^|          \                         ^|   L
echo  ^| ^| ^|           Y                        A  J
echo  ^|   I           ^|                       /I\ /
echo  ^|    \          I             \        ( ^|]/^|
echo  J     \         /._           /        -tI/ ^|
echo   L     )       /   /'-------'J           `'-:.
echo   J   .'      ,'  ,' ,     \   `'-.__          \
echo    \ T      ,'  ,'   )\    /^|        ';'---7   /
echo     \^|    ,'L  Y...-' / _.' /         \   /   /
echo      J   Y  ^|  J    .'-'   /         ,--.(   /
echo       L  ^|  J   L -'     .'         /  ^|    /\
echo       ^|  J.  L  J     .-;.-/       ^|    \ .' /
echo       J   L`-J   L____,.-'`        ^|  _.-'   ^|
echo        L  J   L  J                  ``  J    ^|
echo        J   L  ^|   L                     J    ^|
echo         L  J  L    \                    L    \
echo         ^|   L  ) _.'\                    ) _.'\
echo         L    \('`    \                  ('`    \
echo          ) _.'\`-....'                   `-....'
echo         ('`    \
echo          `-.___/   sk
pause
goto end
:end
