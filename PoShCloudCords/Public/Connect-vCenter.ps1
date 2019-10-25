function Connect-vCenter {
    <#
    .SYNOPSIS
        Connect to vCenter Server.
    .PARAMETER VIServer
        vCenter server to connect to.
    .PARAMETER Credential
        PSCredential object.
    .EXAMPLE
        Connect-vCenter -VIServer "servername.toconnect.to" -Credential $CredentialObject
    #>
    param( 
        [parameter(Mandatory=$true)]
        [string] $VIServer,
        [Parameter(Mandatory=$true)]
        [SecureString] $Credential
    )
    Get-Module -ListAvailable VMware* | Import-Module | Out-Null
    try {
        Write-Host "Connecting to $VIServer"
        Connect-VIServer $VIServer -Credential $Credential -EA 0 -WA 0 | Out-Null
        Write-Host "Successfully connected to $VIServer"
        Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction 'Ignore' -Confirm:$False -Scope Session | Out-Null #> $null
    }
    catch {
        Write-Host "Error connecting to $VIServer"
    }
}