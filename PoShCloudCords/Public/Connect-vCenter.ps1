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
        [System.Management.Automation.PSCredential] $Credential
    )
    Get-Module -ListAvailable VMware* | Import-Module | Out-Null
    try {
        Write-Host "Setting PowerCLI Configuration"
        Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction 'Ignore' -ParticipateInCEIP $false -Confirm:$False -Scope Session > $null
        Write-Host "Connecting to $VIServer"
        Connect-VIServer -Server $VIServer -Credential $Credential -EA 0 -WA 0 | Out-Null
        Write-Host "Successfully connected to $VIServer"
    } 
    catch {
        Write-Host "Error connecting to $VIServer"
    }
}