function Get-KeePass_Entry {
    <#
    .SYNOPSIS
        Get the contents of an existing KeePass Entry.
    .PARAMETER MasterKey
        Secure string password to open the KeePass Database.
    .PARAMETER ProfileName
        The name of the Profile to be used.
    .PARAMETER Title
        The full name of the account to be retreived.
    .PARAMETER UserName
        The user name of the account to be retreived.
    .EXAMPLE
        Get-KeePass_Entry -MasterKey $EncKeePassPassword -$ProfileName "KeePassDB" -Title "User Name Title " -UserName "user.name"
    #>
    param(
        [Parameter(Mandatory = $true)]
        [Security.SecureString] $MasterKey,
        [parameter(Mandatory = $true)]
        [string] $ProfileName,
        [parameter(Mandatory=$false)]
        [string] $Title,
        [parameter(Mandatory=$false)]
        [string] $UserName
    )
    $Get_KPEntry = (Get-KeePassEntry -AsPlainText -DatabaseProfileName $ProfileName -MasterKey $MasterKey | Where-Object {$_.Title -like "$Title"})
    if (!($Get_KPEntry)) {
        Write-Host "The account `"$Title`" could not be found in KeePass"
    }
    else {
        Write-Host "The account `"$Title`" details have been gathered for the next step."
    }
[hashtable]$AccountInfo = @{}
$AccountInfo.Title = $Get_KPEntry.Title
$AccountInfo.UserName = $Get_KPEntry.UserName
$AccountInfo.Password = $Get_KPEntry.Password
return $AccountInfo
}