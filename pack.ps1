. .\config.ps1

cd $global:OpenSSL_sourcedir

& nmake install

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal

$installedPath = 'C:\Program Files\OpenSSL'
$vcsuffix = [string]::Format('vc{0}', $env:VisualStudioVersion.Replace('.', ''))
$distFile = [string]::Format(
    'openssl-{0}-binary-icinga-{1}-{2}.zip',
	$OpenSSL_version,
	$env:Platform,
	$vcsuffix
)

if (Test-Path $distFile) {
	Remove-Item -Recurse $distFile
}

[System.IO.Compression.ZipFile]::CreateFromDirectory($installedPath,
	$distFile, $compressionLevel, $false)