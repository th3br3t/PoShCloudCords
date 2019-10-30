if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1)
{
    Deploy Module {
        By AppVeyorModule {
            FromSource $ENV:BHProjectName
            To CloudCords
            WithOptions @{
                ApiKey = $ENV:NugetApiKey
            }
        }
    }
}