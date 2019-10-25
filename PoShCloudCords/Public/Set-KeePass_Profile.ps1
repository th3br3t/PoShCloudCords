function Set-KeePass_Profile {
    <#
    .SYNOPSIS
        Create a new KeePass Profile.
    .PARAMETER Path
        Either a relative, or a UNC path to the location of the KeePass Database
    .PARAMETER Database
        The name of the databse file for KeePass.
    .PARAMETER ProfileName
        The name of the profile to be used.
    .EXAMPLE
        Set-KeePass_Profile -Path "C:\Passwords" -Database "kiran.kdbx" -ProfileName "KiranKeePassDB"
    #>
    param(
        [parameter(Mandatory=$true)]
        [string] $Path,
        [parameter(Mandatory=$true)]
        [string] $Database,
        [parameter(Mandatory=$true)]
        [string] $ProfileName
    )
    $File = "$Path\$Database"
        if (Get-KeePassDatabaseConfiguration -DatabaseProfileName $ProfileName) {
            Write-Host "A KeePass Database Configuration Profile Already exists with the specified name: $ProfileName."
        }
        else {
            Write-Host "Creating a new KeePass Database Configuration Profile named `"$ProfileName`"."
            New-KeePassDatabaseConfiguration -DatabaseProfileName $ProfileName -DatabasePath $File -UseMasterKey
        }
}