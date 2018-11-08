function Add-KeePass_Entry {
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
    $NewPassword = (New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -ExcludeCharacters $Exclude_Chars -Length 20)
    $Get_KPEntry = (Get-KeePassEntry -AsPlainText -DatabaseProfileName $DatabaseProfileName -MasterKey $MasterKey | Where-Object {$_.Title -like "$Title"})
    if (!($Get_KPEntry)) {
        Write-Host "Creating account `"$Title`" in KeePass"
        New-KeePassEntry -DatabaseProfileName $DatabaseProfileName -MasterKey $MasterKey -KeePassEntryGroupPath "kiran" -Title $Title -UserName $UserName -KeePassPassword $NewPassword -Notes $KPNotes
    }
    else {
        Write-Host "The account `"$Title`" was found in KeePass."
    }
}