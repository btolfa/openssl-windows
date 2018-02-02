OpenSSL for Windows
===================

This is an Icinga internal dist build for Windows, which we will use in the
future to build Icinga 2 for Windows.

Our requirement is that we build with the same Visual Studio version, as
what Icinga 2 builds from.

## Requirements

* Visual Studio 2017 (or earlier)
* NASM
* Perl/ActivePerl

For NASM it is best to use Chocolatey, see [package details](https://chocolatey.org/packages/nasm).

```
choco install nasm
```

## Building

Use the Powershell scripts included:

* `config.ps1` includes path and config options
* `prepare.ps1` will download and extract OpenSSL
* `build.ps1` will build OpenSSL
* `test.ps1` will run tests for OpenSSL
* `pack.ps1` installs OpenSSL to `c:\\Program Files`

## License

We share the same license as OpenSSL for the build scripts.

See [license.txt](license.txt).