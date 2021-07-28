Unicode true
;--------------------------------
;
; Instalador de Argentum Online
; creado por AlejoLp (alejolp@alejolp.com)
; y Maraxus (juansotuyo@gmail.com)
; Modificado por:
; Juan Andres Dalmasso (CHOTS) 
; y Lucas Recoaro (Recox)
; Para Argentum Online Libre
;
;--------------------------------
!include LogicLib.nsh
!include "Constants.nsh"
!include "InstallConfiguration.nsh"
!include "ModernUI.nsh"
!include "IL8N.nsh"

;--------------------------------
; Installs the GameFiles, creates desktop shortcuts and creates start menu group

Section "${PRODUCT_NAME}" SEC_ARGENTUM
  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ;--------------------------------------------------------------------
  ; *** Los archivos del juego ***
  File /r "${GAME_FILES}\*.*"
  
  ;--------------------------------------------------------------------
  ; Write the installation path into the registry
  WriteRegStr HKLM ${AO_INSTALLDIR_REGKEY} "${INSTALL_DIR_REG_NAME}" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "${AO_UNISTALLER_REGKEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "${AO_UNISTALLER_REGKEY}" "UninstallString" '"$INSTDIR\${UNINSTALLER_NAME}"'
  WriteRegDWORD HKLM "${AO_UNISTALLER_REGKEY}" "NoModify" 1
  WriteRegDWORD HKLM "${AO_UNISTALLER_REGKEY}" "NoRepair" 1
  
  WriteUninstaller "${UNINSTALLER_NAME}"

  Call CreateStartMenuGroup
SectionEnd

;--------------------------------
; C++ Runtime

Section "Visual Studio C++ Runtime"
  SectionIn RO
  SetOutPath "$INSTDIR"
  File "${DEPENDS_FOLDER}\VC_redist.x86.exe"
  ExecWait "$INSTDIR\VC_redist.x86.exe /install /quiet /norestart"
SectionEnd

;--------------------------------
; Optional section (can be disabled by the user)
; Creates a shortcut to the application in the desktop

Section "$(DESKTOP_LINK_COMPONENT)" SEC_DESKTOP_LINK
	
  SetOutPath "$INSTDIR\Launcher"
  CreateShortCut "$DESKTOP\${GAME_LINK_FILE_NAME}" "$INSTDIR\${GAME_CLIENT_FILE}" "" "$INSTDIR\${GAME_CLIENT_FILE}" 0

SectionEnd


;--------------------------------
; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "${AO_UNISTALLER_REGKEY}"
  DeleteRegKey HKLM "${AO_INSTALLDIR_REGKEY}"

  ; Remove Start Menu shortcuts and folders, if any
  !insertmacro MUI_STARTMENU_GETFOLDER Application $MUI_TEMP

  ; Remove leftovers of the installer
  Delete "$SMPROGRAMS\$MUI_TEMP\*.*"
  RMDir /r "$SMPROGRAMS\$MUI_TEMP"

  ; Remove Desktop shortcut, if any
  Delete "$DESKTOP\${GAME_LINK_FILE_NAME}"

  ; Remove game files inside the installation directory
  Delete "$INSTDIR\*.*"
  
  ; Remove the installation directory itself
  RMDir /r "$INSTDIR"

SectionEnd

;--------------------------------
; Installer Functions
Function .onInit

   ; Ensure that we have the proper permissions to perform this operation
   UserInfo::GetAccountType
   pop $0
   ${If} $0 != "admin" ;Require admin rights on NT4+
         MessageBox mb_iconstop ${ERROR_NOT_ADMIN}
         SetErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
         Quit
   ${EndIf}

  ; Make sure we request for the language
  !insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd


;--------------------------------
; Uninstaller Functions

Function un.onInit

  ; Make sure we request for the language
  !insertmacro MUI_UNGETLANGUAGE

FunctionEnd


;--------------------------------
; Section descriptions

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN

!insertmacro MUI_DESCRIPTION_TEXT ${SEC_ARGENTUM} "$(ARGENTUM_DESC)"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_DESKTOP_LINK} "$(DESKTOP_LINK_DESC)"

!insertmacro MUI_FUNCTION_DESCRIPTION_END