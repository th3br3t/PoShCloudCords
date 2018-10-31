# Publish to AppVeyor if we're in AppVeyor
if(
    $env:BHProjectName -and $ENV:BHProjectName.Count -eq 1 -and
    $env:BHBuildSystem -eq 'AppVeyor'
   )
{
    Deploy DeveloperBuild {
        By AppVeyorModule {
            FromSource $ENV:BHProjectName
            To AppVeyor
            WithOptions @{
                Version = $env:APPVEYOR_BUILD_VERSION
            }
        }
    }
}

<#
if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1)
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
#>