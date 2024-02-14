# Use the official PowerShell image from Docker Hub
FROM mcr.microsoft.com/powershell:latest

WORKDIR /app
# Copy your PowerShell script into the container
COPY fibonacci.ps1 /app/

# Run the PowerShell script when the container starts
ENTRYPOINT ["pwsh", "-File", "./fibonacci.ps1"]

