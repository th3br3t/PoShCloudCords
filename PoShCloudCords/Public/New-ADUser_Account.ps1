function New-ADUser_Account {
param(
    [Parameter(Mandatory=$true)]
    [String] $DisplayName,
    [Parameter(Mandatory=$true)]
    [String] $UserName,
    [Parameter(Mandatory=$true)]
    [String] $Description,
    [Parameter(Mandatory=$true)]
    [Security.SecureString] $Password

)
    $RootDN = (Get-ADDomain).DistinguishedName
    $Domain = $env:USERDNSDOMAIN.ToLower()
    If (!(Get-ADUser -Filter {sAMAccountName -eq $UserName})) {
        Write-Host "Creating account `"$UserName`" in $Domain" -Fore Magenta
        New-ADUser -SamAccountName $UserName -Name $DisplayName -UserPrincipalName $UserName@$Domain -DisplayName $DisplayName -Description $Description `
        -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true `
        -Path "OU=.Automation,OU=Customers,$rootDN" -EA 1 -WA 0 | Out-Null
    }
    Else {
        Write-Host "The account `"$UserName`" already exists in `"$Domain`"." -Fore Magenta
    }
}