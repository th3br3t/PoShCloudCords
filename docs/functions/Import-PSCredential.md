# Add-AADAppRoleAssignment

## SYNOPSIS
Create PSCredential object from encrypted key files.

## SYNTAX

```
Add-AADAppRoleAssignment [-ServicePrincipal] <Object[]> [-User] <Object[]> [[-BaseURL] <String>]
 [[-APIVersion] <String>] [[-RoleID] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Create PSCredential object from encrypted key files.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Create-PSCredential -User "User\Name" -PasswordFile \\Path\To\UserName_Pass.xml -KeyFile \\Path\To\UserName_Pass.xml
```

## PARAMETERS

### -User
MSGraphAPI.DirectoryObject.ServicePrincipal retruned by the Get-AADServicePrincipal* cmdlets

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
The Azure AD Graph Base URL.
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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### MSGraphAPI.DirectoryObject.AppRoleAssignment

## NOTES

## RELATED LINKS

[http://psmsgraph.readthedocs.io/en/latest/functions/Add-AADAppRoleAssignment](http://psmsgraph.readthedocs.io/en/latest/functions/Add-AADAppRoleAssignment)

[http://psmsgraph.readthedocs.io/en/latest/functions/Remove-AADAppRoleAssignment](http://psmsgraph.readthedocs.io/en/latest/functions/Remove-AADAppRoleAssignment)

[http://psmsgraph.readthedocs.io/en/latest/functions/Get-AADUserAppRoleAssignment](http://psmsgraph.readthedocs.io/en/latest/functions/Get-AADUserAppRoleAssignment)

[http://psmsgraph.readthedocs.io/en/latest/functions/Get-AADServicePrincipalAppRoleAssignedTo](http://psmsgraph.readthedocs.io/en/latest/functions/Get-AADServicePrincipalAppRoleAssignedTo)

