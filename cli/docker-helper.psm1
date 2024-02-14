# Importing the powershell modules
Import-Module .\commands\build-docker-image.psm1 -Force
Import-Module .\commands\copy-prerequisites.psm1 -Force
Import-Module .\commands\run-docker-container.psm1 -Force

# DockerHelper function
function DockerHelper {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Position=0, Mandatory=$true)]
        [ValidateSet("Build-DockerImage", "Copy-Prerequisites", "Run-DockerContainer")]
        [string]$Command

    )

    switch ($Command) {
       "Build-DockerImage" {
          Build.DockerImage
        }
        "Copy-Prerequisites" {
           Copy.Prerequisites
         }
         "Run-DockerContainer"{
            Run.DockerContainer
         }

    }
}

