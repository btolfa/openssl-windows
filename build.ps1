. .\config.ps1

cd $global:OpenSSL_sourcedir

& perl Configure --openssldir="C:\Program Files\OpenSSL\etc" VC-WIN64A
if ($lastexitcode -ne 0){ exit $lastexitcode }

& nmake.exe
if ($lastexitcode -ne 0){ exit $lastexitcode }

exit 0