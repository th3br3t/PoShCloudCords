# Import-PSCredential

## SYNOPSIS
Create PSCredential object from encrypted key files.

## SYNTAX

```
Import-PSCredential [-User] <Object[]> [-PasswordFile] <Object[]> [[-KeyFile] <Object[]>]
```

## DESCRIPTION
Builds on principals detailed in Secure Password with PowerShell: Encrypting Credentials – Part 2 http://www.adminarsenal.com/admin-arsenal-blog/secure-password-with-powershell-encrypting-credentials-part-2
Allows for creation of encrypted credential objects based on tranportable xml files. they are independant of machine and user profiles.


## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Create-PSCredential -User "User\Name" -PasswordFile \\Path\To\UserName_Pass.xml -KeyFile \\Path\To\UserName_Pass.xml
```

## PARAMETERS

### -User
SystemObject.PSCredential

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -PasswordFile
MSGraphAPI.DirectoryObject.User object returnedfrom the Get-AADUser* cmdltes

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -KeyFile
xml file The Azure AD Graph Base URL.
This is not required.
Deafult
     https://graph.windows.net

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: Https://graph.windows.net
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCredential {}

## NOTES

## RELATED LINKS
[https://poshcloudcords.readthedocs.io/en/latest/functions/Import-PSCredential/](https://poshcloudcords.readthedocs.io/en/latest/functions/Import-PSCredential/)



