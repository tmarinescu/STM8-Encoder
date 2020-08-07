echo RUNNING STM8 ENVIRONMENT
echo INGO - Calling build...
call build.bat || goto :failed_build
echo INFO - Done building!
echo INFO - Calling flash...
call flash.bat || goto :failed_flash
echo INFO - Done flashing!
echo INFO - COMPLETED
goto :exit

:failed_build
echo ERROR - Build failed!
goto :exit

:failed_flash
echo ERROR - Flash failed!
goto :exit

:exit