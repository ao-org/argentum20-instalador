;--------------------------------
; Informacion basica del programa - Modificar estos strings para cada servidor
!define PRODUCT_NAME     "AO20"

!define GAME_CLIENT_FILE "Launcher\LauncherAO20.exe"
!define GAME_MANUAL_FILE "Manual.url"
!define WEBSITE          "https://ao20.com.ar"


; Folder in which the game files are stored (relative to script)
!define GAME_FILES       "..\files"

; Folder in which additional game dependencies for the game are stored (relative to script)
!define DEPENDS_FOLDER   "..\dependencies"

; Nombre del grupo de registros a crearse
!define AO_BASIC_REGKEY "AO20"

; Nombre del ejecutable que desinstalara la aplicacion
!define UNINSTALLER_NAME "uninstall.exe"

; Both icons MUST have the same size and depth!
!define APP_ICON         "assets\install.ico"
!define APP_UNINST_ICON  "assets\uninst.ico"


;Banner displayed on top during installation. MUST be a bmp.
!define INSTALL_BANNER   "assets\logoao.bmp"

;----------------------------------------------------------------------------------------
; ADVERTENCIA: De aca en mas no deberaas de tocar si no sabes lo que estas haciendo...
;----------------------------------------------------------------------------------------

;--------------------------------
; Variables de uso frecuente

!define AO_INSTALLDIR_REGKEY "Software\${AO_BASIC_REGKEY}"
!define AO_UNISTALLER_REGKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${AO_BASIC_REGKEY}"
!define AO_SM_FOLDER "${PRODUCT_NAME}"
!define AO_STARTMENU_FULL_DIR "$SMPROGRAMS\${AO_SM_FOLDER}"

!define GAME_LINK_FILE_NAME "${PRODUCT_NAME}.lnk"

!define INSTALL_DIR_REG_NAME "Install_Dir"