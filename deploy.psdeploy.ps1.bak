if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1)
{
    Deploy Module {
        By PSGalleryModule {
            FromSource $ENV:BHProjectName
            To CloudCordsRepository
            WithOptions @{
                ApiKey = $ENV:NugetApiKey
            }
        }
    }
}