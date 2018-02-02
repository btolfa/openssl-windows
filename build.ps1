. .\config.ps1
$ErrorActionPreference = "Stop"

cd $global:OpenSSL_sourcedir

perl Configure --openssldir="C:\Program Files\OpenSSL\etc" VC-WIN64A

nmake
