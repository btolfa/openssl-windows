. .\config.ps1

cd $global:OpenSSL_sourcedir

& perl Configure --openssldir="C:\Program Files\OpenSSL\etc" $global:OpenSSL_target
if ($lastexitcode -ne 0){ exit $lastexitcode }

& nmake.exe
if ($lastexitcode -ne 0){ exit $lastexitcode }

cd ..

exit 0