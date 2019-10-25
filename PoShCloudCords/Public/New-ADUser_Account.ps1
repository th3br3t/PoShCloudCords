function New-ADUser_Account {
    <#
    .SYNOPSIS
        Creates a new User Account in Active Directory.
    .PARAMETER DisplayName
        The full name of the account to be created.
    .PARAMETER UserName
        The user name of the account to be created.
    .PARAMETER Description
        Text to be entered into the description field on the new user account.
    .PARAMETER Password
        Secure string password to be set on the account.
    .PARAMETER Path
        The DistinguishedName of the OU that the account is to be created in.
    .EXAMPLE
        New-ADUser -SamAccountName $UserName -Name $DisplayName -UserPrincipalName $UserName@$Domain -DisplayName $DisplayName -Description "IIS App Pool Account" `
		-AccountPassword $EncPassword -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true -Path "OU=.Automation,OU=Customers,DC=cloudcords,DC=local"
    #>
    param(
        [Parameter(Mandatory=$true)]
        [String] $DisplayName,
        [Parameter(Mandatory=$true)]
        [String] $UserName,
        [Parameter(Mandatory=$true)]
        [String] $Description,
        [Parameter(Mandatory=$true)]
        [SecureString] $Password,
        [Parameter(Mandatory=$true)]
        [String] $Path
    )
    $Domain = $env:USERDNSDOMAIN.ToLower()
    if (Get-ADUser -Filter { sAMAccountName -eq $UserName}) {
        Write-Host "The account `"$UserName`" already exists in `"$Domain`"."
    }
    else {
        Write-Host "Creating account `"$UserName`" in $Domain"
        New-ADUser -SamAccountName $UserName -Name $DisplayName -UserPrincipalName $UserName@$Domain -DisplayName $DisplayName -Description $Description `
        -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true `
        -Path $Path -EA 1 -WA 0 | Out-Null
    }
}