. .\config.ps1
$ErrorActionPreference = "Stop"

cd $global:OpenSSL_sourcedir

nmake test
