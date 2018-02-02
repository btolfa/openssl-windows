. .\config.ps1
$ErrorActionPreference = "Stop"

cd $global:OpenSSL_sourcedir

nmake install

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal

$installedPath = 'C:\Program Files\OpenSSL'
$distFile = "openssl-" + $OpenSSL_version + "-binary-icinga-" + $env:Platform + ".zip"

if (Test-Path $distFile) {
	Remove-Item -Recurse $distFile
}

[System.IO.Compression.ZipFile]::CreateFromDirectory($installedPath,
	$distFile, $compressionLevel, $false)