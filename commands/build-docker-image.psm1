function Build.DockerImage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Dockerfile,
        
        [Parameter(Mandatory=$true)]
        [string]$Tag,
        
        [Parameter(Mandatory=$true)]
        [string]$Context
    )

    $buildspace= Read-Host "Type'Yes'if you want to build the Docker image on remote host. Press any other key to run locally"
    
    # Build the docker image on remote host
    if ($buildspace -eq "Yes") {
        [string]$ComputerName = Read-Host "Enter the Remote host name"
        $dockerCmd = "docker build -t $Tag -f $Dockerfile $Context"
        Invoke-Command -ComputerName $ComputerName -ScriptBlock { param($dockerCmd) & $dockerCmd } -ArgumentList $dockerCmd
    } 
    
    # Build the docker image locally
    else {
        docker build -t $Tag -f $Dockerfile $Context
    }

} 