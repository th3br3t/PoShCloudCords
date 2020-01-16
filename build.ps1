param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, PSDeploy, BuildHelpers -force
Install-Module Pester -Force -SkipPublisherCheck
Import-Module Psake, BuildHelpers

Set-BuildEnvironment

#Update Module Manifest version
[System.Version]$currentManifestVersion = (Import-LocalizedData -FileName PoShCloudCords.psd1).ModuleVersion
if ($buildNumber -gt $currentManifestVersion) {
    Update-ModuleManifest -Path .\PoShCloudCords.psd1 -ModuleVersion $buildNumber
}

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )