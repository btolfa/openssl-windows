$OpenSSL_version = "1_1_0g"
$OpenSSL_file = "OpenSSL_$OpenSSL_version.zip"
$OpenSSL_zipdir = "openssl-OpenSSL_$OpenSSL_version"
$OpenSSL_url = "https://github.com/openssl/openssl/archive/$OpenSSL_file"

if (-Not (Test-Path $OpenSSL_file)) {
    Write-Output "Downloading OpenSSL from $OpenSSL_url"
    Invoke-WebRequest -Uri $OpenSSL_url -OutFile $OpenSSL_file
    if (Test-Path $OpenSSL_zipdir) {
        Remove-Item $OpenSSL_zipdir
    }
}

if (-Not (Test-Path($OpenSSL_zipdir))) {
    Write-Output "Extracting ZIP to $OpenSSL_zipdir"
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($OpenSSL_file, ".")
}

cd $OpenSSL_zipdir

$env:Path += ";C:\Program Files\NASM"

perl Configure VC-WIN64A

nmake
nmake test
nmake install
