. .\config.ps1

if (Test-Path $global:OpenSSL_file) {
    Write-Output "OpenSSL archive available at $global:OpenSSL_file"
} else {
    Write-Output "Downloading OpenSSL from $global:OpenSSL_url"
	$progressPreference = 'silentlyContinue'
    Invoke-WebRequest -Uri $global:OpenSSL_url -OutFile $global:OpenSSL_file
	$progressPreference = 'Continue'
}

if (Test-Path $global:OpenSSL_sourcedir) {
	Remove-Item -Recurse $global:OpenSSL_sourcedir
}

Write-Output "Extracting ZIP to $global:OpenSSL_sourcedir"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[string]$pwd = Get-Location
[System.IO.Compression.ZipFile]::ExtractToDirectory($pwd + "/" + $global:OpenSSL_file, $pwd)