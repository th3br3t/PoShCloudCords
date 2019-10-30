if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1)
{
    Deploy Module {
        By AppVeyorModule {
            FromSource $ENV:BHProjectName
            To Environment
            Name CloudCords
            WithOptions @{
                Name = 'CloudCords'
                Version = $env:APPVEYOR_BUILD_VERSION
            }
        }
    }
}