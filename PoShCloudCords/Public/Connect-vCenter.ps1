function Connect-vCenter {
    <#
    .SYNOPSIS
        Connect to vCenter Server.
    .PARAMETER VIServer
        vCenter server to connect to.
    .PARAMETER Credential
        PSCredential object.
    .EXAMPLE
        Create-PSCredential -VIServer "servername.toconnect.to" -Credential $CredentialObject
    #>
    param(
        [CmdletBinding()] 
        [parameter(Mandatory=$true)]
        [string] $VIServer,
        #[Parameter(Mandatory=$true)]
        #[Security.SecureString] $Credential,
        [parameter(Mandatory=$true)]
        [string] $Credential
    )
Get-Module -ListAvailable VMware* | Import-Module | Out-Null
    try {
        Write-Host "Connecting to $VIServer" -Fore Magenta
        Connect-VIServer $VIServer -Credential $Credential -EA 0 -WA 0 > $null
        Write-Host "Successfully connected to $VIServer" -Fore Magenta
        Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction 'Ignore' -Confirm:$False -Scope Session > $null
    }
    catch {
        Write-Host "Error connecting to $VIServer"
    }
}