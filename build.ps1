. .\config.ps1

cd $global:OpenSSL_sourcedir

perl Configure VC-WIN64A

nmake
#nmake test
#nmake install
