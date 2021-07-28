;--------------------------------
; General Configuration

Name "${PRODUCT_NAME}"
OutFile "${PRODUCT_NAME}.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"

;General

CRCCheck force
SetOverwrite on
AutoCloseWindow false
ShowInstDetails show
ShowUninstDetails show
AllowRootDirInstall true
SetCompressor /SOLID lzma

; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
InstallDirRegKey HKLM ${AO_INSTALLDIR_REGKEY} "${INSTALL_DIR_REG_NAME}"

RequestExecutionLevel admin ;Require admin rights on NT6+ (When UAC is turned on)