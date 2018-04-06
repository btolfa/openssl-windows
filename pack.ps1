. .\config.ps1

$installedPath = 'C:\Program Files\OpenSSL'

cd $global:OpenSSL_sourcedir

Write-Output "Installing OpenSSL to $installedPath"
& nmake.exe install

cd ..

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal

$vcsuffix = [string]::Format('vc{0}', $env:VisualStudioVersion.Replace('.', ''))
[string]$pwd = Get-Location
$distFile = [string]::Format(
    'openssl-{0}-binary-{1}-{2}.zip',
	$OpenSSL_version,
	$env:Platform,
	$vcsuffix
)
$distFilePath = $pwd + '/' + $distFile

if (Test-Path $distFile) {
	Write-Output "Deleting old ZIP $distFile"
	Remove-Item -Recurse $distFile
}

Write-Output "Packing OpenSSL into a ZIP file at $distFilePath"
[System.IO.Compression.ZipFile]::CreateFromDirectory(
	$installedPath,
	$distFilePath,
	$compressionLevel,
	$false
)
	
exit 0