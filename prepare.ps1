. .\config.ps1

if (Test-Path $global:OpenSSL_file) {
    Write-Output "OpenSSL archive available at $global:OpenSSL_file"
} else {
    Write-Output "Downloading OpenSSL from $global:OpenSSL_url"
    Invoke-WebRequest -Uri $global:OpenSSL_url -OutFile $global:OpenSSL_file
}

if (Test-Path $global:OpenSSL_sourcedir) {
	Remove-Item -Recurse $global:OpenSSL_sourcedir
}

Write-Output "Extracting ZIP to $global:OpenSSL_sourcedir"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($global:OpenSSL_file, ".")
