﻿# See http://www.appveyor.com/docs/appveyor-yml for many more options

environment:
  NugetApiKey:
    secure: RRnC6NwiccW4vW9257cp

# Allow WMF5 (i.e. PowerShellGallery functionality)
os: WMF 5

# Skip on updates to the readme.
# We can force this by adding [skip ci] or [ci skip] anywhere in commit message 
skip_commits:
message: /updated readme.*|update readme.*s/

build: false

#Kick off the CI/CD pipeline
test_script:
- ps: . .\build.ps1