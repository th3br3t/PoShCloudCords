function Add-KeePass_Profile {
    $KeePassPath = "\\s-i-km.cloudcords.local\Shared"
    $KeePassDB = "kiran.kdbx"
    $KeePassFile = "$KeePassPath\$KeePassDB"
    $DatabaseProfileName = "KiranDB"
        if (Get-KeePassDatabaseConfiguration -DatabaseProfileName $DatabaseProfileName) {
            Write-Host "A KeePass Database Configuration Profile Already exists with the specified name: $DatabaseProfileName." -Fore Magenta
        }
        else {
            Write-Host "Creating a new KeePass Database Configuration Profile named $DatabaseProfileName." -Fore Magenta
            New-KeePassDatabaseConfiguration -DatabaseProfileName $DatabaseProfileName -DatabasePath $KeePassFile -UseMasterKey
        }
}