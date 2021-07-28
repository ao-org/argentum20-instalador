; Para la creacion del grupo en el Menu de Inicio
Var START_MENU_FOLDER
Var MUI_TEMP

!include "MUI.nsh"
!include "Library.nsh"

;--------------------------------
;Interface Configuration

!define MUI_ICON "${APP_ICON}"
!define MUI_UNICON "${APP_UNINST_ICON}"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${INSTALL_BANNER}"
!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "$INSTDIR\${GAME_CLIENT_FILE}"
!define MUI_FINISHPAGE_LINK "${WEBSITE}"
!define MUI_FINISHPAGE_LINK_LOCATION "${WEBSITE}"


;--------------------------------
; Pages for instalation

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $START_MENU_FOLDER
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH


;--------------------------------
; Pages for uninstalation

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH


;--------------------------------
; Languages

!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "English"


;--------------------------------
;Reserve Files

;If you are using solid compression, files that are required before
;the actual installation should be stored first in the data block,
;because this will make your installer start faster.

!insertmacro MUI_RESERVEFILE_LANGDLL


;----------------------------------------
; Create Start Menu group

Function CreateStartMenuGroup

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application

    ;Create shortcuts
    CreateDirectory "${AO_STARTMENU_FULL_DIR}"

    CreateShortCut "${AO_STARTMENU_FULL_DIR}\$(UNINSTALL_LINK)" "$INSTDIR\${UNINSTALLER_NAME}" "" "$INSTDIR\${UNINSTALLER_NAME}" 0

    CreateShortCut "${AO_STARTMENU_FULL_DIR}\${GAME_LINK_FILE_NAME}" "$INSTDIR\${GAME_FILES}\${GAME_CLIENT_FILE}" "" "$INSTDIR\${GAME_FILES}\${GAME_CLIENT_FILE}" 0

  !insertmacro MUI_STARTMENU_WRITE_END

FunctionEnd