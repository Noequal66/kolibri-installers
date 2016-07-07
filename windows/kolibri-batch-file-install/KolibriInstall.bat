
rem Python variable

set usr=%userprofile%
set pythonSetup=python-setup\python-3.5.2.exe
set pythonPath=%usr%"\AppData\Local\Programs\Python"
set pythonVersion="\Python35-32"

set pythonExe=%pythonPath%%pythonVersion%"\python.exe"

rem Check processor architecture.
set ostype=%PROCESSOR_ARCHITECTURE%
IF NOT %ostype% equ x86 (
   set pythonVersion="\Python35"
   set pythonSetup=python-setup\python-3.5.0-amd64.exe
)

set pythonExe=%pythonPath%%pythonVersion%"\python.exe"
@echo "=====" %pythonExe%
rem Install python3.5
IF NOT EXIST %pythonExe% (
    start %pythonSetup%
    @echo "Please Install python on this path" %pythonPath%
    pause

    rem Set Kolibri environment variables
    setx KOLIBRI_PYTHON %pythonExe%
    setx KOLIBRI_SCRIPTS %pythonScripts%
)

set kolibriSdist="kolibri-sdist\kolibri-0.0.1.dev20160707153153.tar.gz"
set pythonScripts=%pythonPath%%pythonVersion%"\Scripts"
set pipExe=%pythonScripts%"\pip"

rem Install kolibri sdist
%pipExe% install %kolibriSdist%

pause





