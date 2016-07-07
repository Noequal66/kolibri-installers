
rem Python variable

set usr=%userprofile%
set pythonSetup="python-setup\python-3.5.2.exe"
set pythonPath=%usr%"\AppData\Local\Programs\Python"
set pythonExe=%pythonPath%"\Python35-32\python.exe"
set pythonScripts=%pythonPath%"\Scripts"

rem Check processor architecture.
set ostype=%PROCESSOR_ARCHITECTURE%
IF NOT %ostype% equ x86 (
   set pythonExe=%pythonPath%"\Python35\python.exe"
   set pythonSetup="python-setup\python-3.5.0-amd64.exe"
)

echo %pythonExe%

rem Install python3.5
IF NOT EXIST %pythonExe% (
    start %pythonSetup%
    @echo "Install python on this path" %pythonPath%
    pause

    rem Set Kolibri environment variables
    setx KOLIBRI_PYTHON %pythonExe%
    setx KOLIBRI_SCRIPTS %pythonScripts%
)

pause

