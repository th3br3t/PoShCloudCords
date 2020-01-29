function Import-PSModule {
    <#
    .SYNOPSIS
        Import a PowerShell module, installs the module from the PowerShell Gallery if it is not installed.
    .PARAMETER Module
        The Name of the module to load.
    .EXAMPLE
        Import-PSModule -Module PoShCloudCords
    #>
    param(
        [parameter(Mandatory=$true)]
        [string] $Module,
        [parameter(Mandatory=$false)]
        [version] $RequiredVersion
    )
    If ( ! (Get-module $Module )) {
    Write-Host "The $Module module does not appear to be loaded"
    Write-Host "Checking to see if the $Module module is installed"   
        if ( ! (Get-Module -ListAvailable -Name $Module)) {
            Write-Host "The Module Module does not appear to be installed"
                try {
                    Write-Host "Installing the $Module Module"
                    Install-Module $Module -Confirm:$false -Force -AllowClobber
                    Write-Host "The $Module Module installed successfully."
                    Write-Host "Importing the $Module Module"
                    Import-Module $Module -EA 1
                    Write-Host "The $Module Module has been imported."
                }
                catch [Exception] {
                    $exception = $_.Exception
                    Write-Host "Unable to install $module module due to $exception" -EA 2
                } 
        }
        else {
            Write-Host "The $Module Module is installed"
                try {
                    Write-Host "Importing the $Module Module"
                    Import-Module $Module -EA 0
                    Write-Host "The $Module Module has been imported."
                }
                catch [Exception]{
                    $status = 1
                    $exception = $_.Exception
                    Write-Host "Unable to import $module module due to $exception" -EA 2
                }
        }
    }
    else {
        Write-Host "The $Module Module is already loaded."
    }
}