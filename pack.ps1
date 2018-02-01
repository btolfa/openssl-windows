. .\config.ps1

cd $global:OpenSSL_sourcedir

nmake install

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal

$installedPath = 'C:\Program Files\OpenSSL'
$distFile = "openssl-$OpenSSL_version.zip"
[System.IO.Compression.ZipFile]::CreateFromDirectory($installedPath,
	$distFile, $compressionLevel, $false)