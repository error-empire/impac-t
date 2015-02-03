!define VERSION "1.0.0-BETA1"
!define APP "Impact"
!define PUBLISHER "c't"
!define SFMLPATH "D:\Developer\SFML-2.1"
!define GLEWPATH "D:\Developer\glew-1.12.0\bin\Release\Win32"
!define ZLIBPATH "..\zlib"

Name "${APP} ${VERSION}"
OutFile "${APP}-${VERSION}-setup.exe"
InstallDir $PROGRAMFILES\${APP}
InstallDirRegKey HKLM "Software\${PUBLISHER}\${APP}" "Install_Dir"
RequestExecutionLevel admin
SetCompressor lzma
ShowInstDetails show

Page license

  LicenseData ..\${APP}\LICENSE

Page directory

Page instfiles


Section "vcredist"
  File vcredist_x86.exe
  ExecWait '"vcredist_x86.exe" /norestart /passive'
SectionEnd


Section "${APP}"
  SetOutPath $INSTDIR
  CreateDirectory "$INSTDIR\resources"
  CreateDirectory "$INSTDIR\resources\backgrounds"
  CreateDirectory "$INSTDIR\resources\fonts"
  CreateDirectory "$INSTDIR\resources\images"
  CreateDirectory "$INSTDIR\resources\levels"
  CreateDirectory "$INSTDIR\resources\music"
  CreateDirectory "$INSTDIR\resources\shaders"
  CreateDirectory "$INSTDIR\resources\soundfx"
  File ..\Release\${APP}.exe
  File ..\${APP}\LICENSE
  File ${ZLIBPATH}\zlib1.dll
  File ${SFMLPATH}\bin\libsndfile-1.dll
  File ${SFMLPATH}\bin\openal32.dll
  File ${SFMLPATH}\bin\sfml-audio-2.dll
  File ${SFMLPATH}\bin\sfml-graphics-2.dll
  File ${SFMLPATH}\bin\sfml-system-2.dll
  File ${SFMLPATH}\bin\sfml-window-2.dll
  File ${SFMLPATH}\bin\sfml-network-2.dll
  File ${GLEWPATH}\glew32.dll
  WriteUninstaller $INSTDIR\uninstall.exe

  SetOutPath $INSTDIR\resources\backgrounds
  File /a /r "..\${APP}\resources\backgrounds\"

  SetOutPath $INSTDIR\resources\fonts
  File /a /r "..\${APP}\resources\fonts\"

  SetOutPath $INSTDIR\resources\images
  File /a /r "..\${APP}\resources\images\"

  SetOutPath $INSTDIR\resources\levels
  File /a /r "..\${APP}\resources\levels\"

#  SetOutPath $INSTDIR\resources\music
#  File /a /r "..\${APP}\resources\music\"

  SetOutPath $INSTDIR\resources\shaders
  File /a /r "..\${APP}\resources\shaders\"

  SetOutPath $INSTDIR\resources\soundfx
  File /a /r "..\${APP}\resources\soundfx\*.ogg"

  SetOutPath $INSTDIR

SectionEnd


Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\${APP}"
  CreateShortCut "$SMPROGRAMS\${APP}\${APP} ${VERSION}.lnk" "$INSTDIR\${APP}.exe"
  CreateShortcut "$SMPROGRAMS\${APP}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
SectionEnd


Section "Uninstall"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP}"
  DeleteRegKey HKLM "SOFTWARE\${APP}"

  Delete $INSTDIR\LICENSE
  Delete $INSTDIR\glew32.dll
  Delete $INSTDIR\zlib1.dll
  Delete $INSTDIR\libsndfile-1.dll
  Delete $INSTDIR\openal32.dll
  Delete $INSTDIR\sfml-audio-2.dll
  Delete $INSTDIR\sfml-graphics-2.dll
  Delete $INSTDIR\sfml-system-2.dll
  Delete $INSTDIR\sfml-window-2.dll
  Delete $INSTDIR\sfml-network-2.dll
  Delete $INSTDIR\${APP}.exe
  Delete $INSTDIR\uninstall.exe

  RMDir /r $INSTDIR\resources
  RMDir $INSTDIR

  Delete "$SMPROGRAMS\${APP}\*.*"
  RMDir "$SMPROGRAMS\${APP}"
  RMDir "$INSTDIR"
SectionEnd