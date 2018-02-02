#$ErrorActionPreference = "Stop"

$global:OpenSSL_version = "1_1_0g"
$global:OpenSSL_file = "OpenSSL_$OpenSSL_version.zip"
$global:OpenSSL_sourcedir = "openssl-OpenSSL_$OpenSSL_version"
$global:OpenSSL_url = "https://github.com/openssl/openssl/archive/$OpenSSL_file"

if (-not (Test-Path env:NASM_PATH)) {
	$env:NASM_PATH = "C:\Program Files\NASM"
}
if (-not ($env:PATH -contains $env:NASM_PATH)) {
	$env:PATH = $env:NASM_PATH + ";" + $env:PATH
}

if (-not (Test-Path env:PERL_PATH)) {
	$env:PERL_PATH = "C:\Perl64\bin"
}
if (-not ($env:PATH -contains $env:PERL_PATH)) {
	$env:PATH = $env:PERL_PATH + ";" + $env:PATH
}
