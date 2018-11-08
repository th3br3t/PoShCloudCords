function Get-KeePass_Entry {
    param(
        [CmdletBinding()] 
        [Parameter(Mandatory=$true)]
        [Security.SecureString] $MasterKey,
        [parameter(Mandatory=$true)]
        [string] $Title,
        [parameter(Mandatory=$true)]
        [string] $UserName

    )
    $DatabaseProfileName = "KiranDB"
    $Time = (Get-Date -UFormat "%A, %b %d, %Y %r")
    $KPNotes = "Entry added by automation on $Time"
    [string]$Exclude_Chars = @()
    $Exclude_Chars += ('"','$','`','`"')
    $Get_KPEntry = (Get-KeePassEntry -AsPlainText -DatabaseProfileName $DatabaseProfileName -MasterKey $MasterKey | Where-Object {$_.Title -like "$Title"})
    if (!($Get_KPEntry)) {
        Write-Host "The account `"$Title`" could not be found in KeePass"
        $NewPassword = (New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -ExcludeCharacters $Exclude_Chars -Length 20)
        New-KeePassEntry -DatabaseProfileName $DatabaseProfileName -MasterKey $MasterKey -KeePassEntryGroupPath "kiran" -Title $Title -UserName $UserName -KeePassPassword $NewPassword -Notes $KPNotes
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