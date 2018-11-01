<#
.Description
Installs and loads all the required modules for the build.
Derived from scripts written by Warren F. (RamblingCookieMonster)
#>

[cmdletbinding()]
param ($Task = 'Default')
"Starting build"

# Grab nuget bits, install modules, set build variables, start build.
"  Install Dependent Modules"
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, PSDeploy, BuildHelpers, -force -Scope CurrentUser
Install-Module Pester -Force -SkipPublisherCheck -Scope CurrentUser -AllowClobber

"  Import Dependent Modules"
Import-Module Psake, BuildHelpers

Set-BuildEnvironment -ErrorAction SilentlyContinue

Invoke-psake -buildFile $ENV:BHProjectPath\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )