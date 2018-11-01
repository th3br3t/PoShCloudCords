function Import-PSModule {
    param(
        [CmdletBinding()] 
        [parameter(Mandatory=$true)]
        [string] $Name
    )
    If ( ! (Get-module $Name )) {
    Write-Host "The $Name module does not appear to be loaded"
    Write-Host "Checking to see if the $Name module is installed"   
        if ( ! (Get-Module -ListAvailable -Name $Name)) {
            Write-Host "The Module Module does not appear to be installed"
                try {
                    Write-Host "Installing the $Name Module"
                    Install-Module $Name -Confirm:$false -Force -AllowClobber
                    Write-Host "The $Name Module installed successfully."
                    Write-Host "Importing the $Name Module"
                    Import-Module $Name -EA 1
                    Write-Host "The $Name Module has been imported."
                }
                catch [Exception] {
                    $exception = $_.Exception
                    Write-Host "Unable to install $Name module due to $exception" -EA 2
                } 
        }
        else {
            Write-Host "The $Name Module is installed"
                try {
                    Write-Host "Importing the $Name Module"
                    Import-Module $Name -EA 0
                    Write-Host "The $Name Module has been imported."
                }
                catch [Exception]{
                    $status = 1
                    $exception = $_.Exception
                    Write-Host "Unable to import $Name module due to $exception" -EA 2
                }
        }
    }
    else {
        Write-Host "The $Name Module is already loaded."
    }
}