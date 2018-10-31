﻿if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1)
{
    Deploy Module {
        By AppVeyorModule {
            FromSource $ENV:BHProjectName
            To 'https://ps.cloudcords.com:4433/nuget/CloudCordsRepository/'
            WithOptions @{
                ApiKey = $ENV:NugetApiKey
            }
        }
    }
}