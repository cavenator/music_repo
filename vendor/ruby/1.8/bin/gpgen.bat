@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"ruby.exe" "C:/Users/Aaron/Documents/Rails/rails_apps/work/DadsProject/vendor/ruby/1.8/bin/gpgen" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"ruby.exe" "%~dpn0" %*
