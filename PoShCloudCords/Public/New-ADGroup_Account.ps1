function New-ADGroup_Account {
param(
    [Parameter(Mandatory=$true)]
    [String] $GroupName,
    [Parameter(Mandatory=$true)]
    [String] $Path
)
    $GetAdGroupEntry = Get-ADObject -Filter * | Where-Object { $_.Name -like "*$GroupName*"} | Select-Object -ExpandProperty Name
    $ObjectProperties = @{ Name = $GroupName.Name }
        if (!($GetAdGroupEntry)) {
            Write-Host "Creating group `"$GroupName`" in $env:USERDNSDOMAIN" -Fore Magenta
            New-ADGroup -Path $Path -Name $GroupName -GroupScope Global -GroupCategory Security
        }
        else {
            Write-Host "The group `"$GroupName`" already exists in `"$env:USERDNSDOMAIN`"." -Fore Magenta   
        }
}