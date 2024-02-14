# Docker-Helper-Cmdlets
Overview
This PowerShell module, named DockerHelper, provides cmdlets to simplify Docker-related operations such as building Docker images, copying prerequisites, and running Docker containers, both locally and on remote hosts.

Prerequisites
PowerShell 5.1 or later
Docker installed on the local or remote host(s)
Installation
Download or clone the DockerHelper module repository.
Copy the module folder to one of the directories listed in the $env:PSModulePath environment variable.
Import the module using import-module .\cli\docker-helper.psm1 -force
Cmdlets

1. Build-DockerImage
This cmdlet builds a Docker image from a specified Dockerfile with a given tag on a local or remote host.

Parameters:
-Dockerfile <String>: Path to the Dockerfile.
-Tag <String>: Docker image name.
-Context <String>: Path to the Docker context directory.
-ComputerName <String>: (Optional) Name of the remote computer where Docker is installed.
Example:
powershell
Copy code
Build-DockerImage -Dockerfile "path/to/Dockerfile" -Tag "my-image" -Context "path/to/context"

2. Copy-Prerequisites
This cmdlet copies files and/or directories from the local machine to a local destination directory on a remote host.

Parameters:
-ComputerName <String>: Name of the remote computer.
-Path <String[]>: Local path(s) to copy files from.
-Destination <String>: Local path on the remote host where files will be copied.
Example:
powershell
Copy code
Copy-Prerequisites -ComputerName "remote-computer" -Path "local/path" -Destination "remote/path"

3. Run-DockerContainer
This cmdlet runs a Docker container on a local or remote host and returns the container name.

Parameters:
-ImageName <String>: Name of the Docker image.
-ComputerName <String>: (Optional) Name of the remote computer.
-DockerParams <String[]>: (Optional) Additional Docker parameters.
Example:
powershell
Copy code
Run-DockerContainer -ImageName "my-image" -ComputerName "remote-computer" -DockerParams "--restart=always"
Fibonacci Container
This task also includes a Dockerfile and a Powershell script to execute Fibonacci series to build the Docker image and run the Docker Container.

When the container is executed without any parameters, it outputs all Fibonacci numbers one by one every 0.5 seconds.
When a number 'n' is passed to the container, it outputs only the corresponding Fibonacci number 'X(n)'.

Steps:
1. Import the module using the command
   import-module .\cli\docker-helper.psm1 -force

2. To Copy the Prerequisites, use  
   DockerHelper Copy-Prerequisites

3. To build the Docker image, use
   DockerHelper Build-DockerImage 

4. Finally to run the Docker image and create the Docker Container, use the below command
   DockerHelper Run-DockerContainer 