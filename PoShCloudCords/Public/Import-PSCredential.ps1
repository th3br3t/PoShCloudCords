function Import-PSCredential {
    <#
    .SYNOPSIS
        Create PSCredential object from encrypted key files.
    .PARAMETER User
        Username
    .PARAMETER PasswordFile
        File location of the .xml file that is part of the credential object.
    .PARAMETER KeyFile
        File location of the .key file that is part of the credential object.
    .EXAMPLE
        Create-PSCredential -User "User\Name" -PasswordFile \\Path\To\UserName_Pass.xml -KeyFile \\Path\To\UserName_Pass.xml
    .LINK
        http://www.adminarsenal.com/admin-arsenal-blog/secure-password-with-powershell-encrypting-credentials-part-2/
        # Article describing how to create encrypted credentials.
    .LINK
        https://hinchley.net/articles/encrypt-and-decrypt-a-password-using-powershell/
        # Encrypt and Decrypt a Password using PowerShell.

    #>
    param(
        [CmdletBinding()] 
        [parameter(Mandatory=$true)]
        [string] $User,
        [parameter(Mandatory=$true)]
        [string] $PasswordFile,
        [parameter(Mandatory=$true)]
        [string] $KeyFile
    )
    $ImportKey = Get-Content $KeyFile
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $PasswordFile | ConvertTo-SecureString -Key $ImportKey)
    return $Credential
}