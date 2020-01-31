param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, PSDeploy, BuildHelpers -force
Install-Module Pester -Force -SkipPublisherCheck
Import-Module Psake, BuildHelpers

Set-BuildEnvironment

#Update Module Manifest version
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
[System.Version]$currentManifestVersion = (Import-LocalizedData -BaseDirectory "$scriptPath\PoShCloudCords" -FileName "PoShCloudCords.psd1").ModuleVersion
if ($buildNumber -gt $currentManifestVersion) {
    Update-ModuleManifest -Path .\PoShCloudCords\PoShCloudCords.psd1 -ModuleVersion $buildNumber
}

<#
$manifest = Import-PowerShellDataFile .\PoShCloudCords\PoShCloudCords.psd1
[version]$version = $Manifest.ModuleVersion
# Add one to the build of the version number
[version]$NewVersion = "{0}.{1}.{2}" -f $Version.Major, $Version.Minor, ($Version.Build + 1) 
# Update the manifest file
Update-ModuleManifest -Path .\PoShCloudCords.psd1 -ModuleVersion $NewVersion
#>

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )
