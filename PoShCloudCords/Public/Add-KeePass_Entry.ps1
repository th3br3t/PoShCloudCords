function Add-KeePass_Entry {
    <#
    .SYNOPSIS
        Create a new KeePass Entry.
    .PARAMETER MasterKey
        Secure string password to open the KeePass Database.
    .PARAMETER ProfileName
        The name of the profile to be used.
    .PARAMETER EntryPath
        The name of the folder that the account is to be created in, in KeePass.
    .PARAMETER Title
        The full name of the account to be created.
    .PARAMETER UserName
        The user name of the account to be created.
    .EXAMPLE
        Add-KeePass_Entry -MasterKey $EncKeePassPassword -ProfileName "KeePassDB" -EntryPath "kiran" -Title "User Name Title " -UserName "user.name"
    #>
    param(
        [Parameter(Mandatory = $true)]
        [Security.SecureString] $MasterKey,
        [parameter(Mandatory = $true)]
        [string] $ProfileName,
        [parameter(Mandatory = $true)]
        [string] $EntryPath, 
        [parameter(Mandatory = $true)]
        [string] $Title,
        [parameter(Mandatory = $true)]
        [string] $UserName
    )
    $Time = (Get-Date -UFormat "%A, %b %d, %Y %r")
    $Notes = "Entry added by automation on $Time"
    $NewPassword = (New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -ExcludeCharacters '&$,"' -ExcludeLookALike -Length 16)
    $Get_KPEntry = (Get-KeePassEntry -AsPlainText -DatabaseProfileName $ProfileName -MasterKey $MasterKey | Where-Object {$_.Title -like "$Title"})
    if (!($Get_KPEntry)) {
        Write-Host "Creating account `"$Title`" in KeePass"
        New-KeePassEntry -MasterKey $MasterKey -DatabaseProfileName $ProfileName -KeePassEntryGroupPath $EntryPath -Title $Title -UserName $UserName -KeePassPassword $NewPassword -Notes $Notes
    }
    else {
        Write-Host "The account `"$Title`" was found in KeePass."
    }
}