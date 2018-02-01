. .\config.ps1

cd $global:OpenSSL_sourcedir

perl Configure --openssldir="C:\Program Files\OpenSSL\etc" VC-WIN64A

nmake
