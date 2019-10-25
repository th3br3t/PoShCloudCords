function New-ADGroup_Account {
    <#
    .SYNOPSIS
        Create a new Global Security Group in Active Directory.
    .PARAMETER GroupName
        Full name of the security group to be created.
    .PARAMETER Path
        The DistinguishedName of the OU that the account is to be created in.
    .EXAMPLE
        New-ADGroup_Account -GroupName "cc-p-wfo-WinAdmins" -Path "OU=.Automation,OU=Customers,DC=cloudcords,DC=local"
    #>
    param(
        [Parameter(Mandatory=$true)]
        [String] $GroupName,
        [Parameter(Mandatory=$true)]
        [String] $Path
    )
    $GetAdGroupEntry = Get-ADObject -Filter * | Where-Object { $_.Name -like "*$GroupName*"} | Select-Object -ExpandProperty Name
    if (!($GetAdGroupEntry)) {
        Write-Host "Creating group `"$GroupName`" in $env:USERDNSDOMAIN"
        New-ADGroup -Path $Path -Name $GroupName -GroupScope Global -GroupCategory Security
    }
    else {
        Write-Host "The group `"$GroupName`" already exists in `"$env:USERDNSDOMAIN`"." 
    }
}