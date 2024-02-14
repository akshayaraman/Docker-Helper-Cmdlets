function Run.DockerContainer {
    [CmdletBinding()]
    param(
        [Parameter(Position=0, Mandatory=$true)]
        [string]$ImageName,
       
        [string[]]$DockerParams,
       
        [string]$ComputerName,
       
        [string]$containerName,

        [string]$container,

        [string]$containerId
    )

    $DockerParams = Read-Host "Enter Docker Parameter values if needed, else please press enter"
    $RunOnRemote= Read-Host "Type'Yes'if you want to run the Docker container on remote host. Press any other key to run locally"
    
    # Run the docker container on remote host
    if ($RunOnRemote -eq "Yes") {
        [string]$ComputerName = Read-Host "Enter the Remote host name"
        
        # Run the docker container
        $container = docker run -it $ImageName $DockerParams
        Invoke-Command -ComputerName $ComputerName -ScriptBlock { param($container) & $container } -ArgumentList $container
        
        # Fetch container id after creating docker container
        $containerId = docker ps -q -l
        
        # Get the container name with the help of the docker container id
        $containerName = docker inspect --format '{{.Name}}' $containerId

        Write-Host($containerName)
    } 
    
    # Run the docker container locally
    else {
        # Run the docker container
        Invoke-Command -ScriptBlock{docker run -it $ImageName $DockerParams}-ArgumentList $container
        
        # Fetch container id after creating docker container
        $containerId = docker ps -q -l
        
        # Get the container name with the help of the docker container id
        $containerName = docker inspect --format '{{.Name}}' $containerId
        
        Write-Host($containerName)
   }

   return $container
}