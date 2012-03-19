@echo off
setlocal 

if "%*" == "" goto USAGE

SET SUBJECTNAME=%*


makecert -pe -ss MY -sr LocalMachine -$ individual -n "CN=%SUBJECTNAME%" -len 2048 -r "%SUBJECTNAME%.cer"
CertMgr.exe /add "%SUBJECTNAME%.cer" /s /r localMachine root
certutil.exe -privatekey -exportpfx "%SUBJECTNAME%" "%SUBJECTNAME%.pfx"

echo.
echo.
echo.
echo.
echo ===========================================================================

echo Created Files: 
dir /b "%SUBJECTNAME%.*"

echo.
echo.
echo To install the certificate on a test machine, you can copy the 
echo "%SUBJECTNAME%.CER" file to the test computer and run:
echo.
echo     CertMgr.exe /add "%SUBJECTNAME%.cer" /s /r localMachine root
echo.

goto fin
:USAGE
echo Create Test Certificate Script
echo. 
echo Creates a certificate along with a private key for testing code signing
echo.
echo Will generate a .CER file (the public certificate that you can install on
echo any machine)
echo.
echo And a .PFX file (the private key and certificate in a PKCS#12 file
echo.
echo Usage:
echo %~f0 "subject name"
echo.
echo The utility will ask for a password when creating a .PFX file.
echo.


goto fin
:FAILED

goto fin
:FIN