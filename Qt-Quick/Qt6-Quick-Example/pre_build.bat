@ECHO OFF

set path=%path%;C:\Qt\Tools\mingw1120_64\bin
C:\Qt\6.6.0\mingw_64\bin\windeployqt6.exe D:\GitHub\Qt-Apps\Qt-Quick\build-Qt6-Quick-Example-Desktop_Qt_6_6_0_MinGW_64_bit-Release

echo "Finished pre-build"
popd
exit /b 0