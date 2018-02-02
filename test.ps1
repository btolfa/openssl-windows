. .\config.ps1

cd $global:OpenSSL_sourcedir

& nmake test
if ($lastexitcode -ne 0){ exit $lastexitcode }

exit 0