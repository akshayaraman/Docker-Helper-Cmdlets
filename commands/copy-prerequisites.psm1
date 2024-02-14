function Copy.Prerequisites {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ComputerName,
        
        [Parameter(Mandatory=$true)]
        [string[]]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    # Copies files and/or directories from local machine to remote host
    Copy-Item -Path $Path -Destination "\\$ComputerName\$Destination" -Force -Recurse

}

    




