param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Version,
    [string]$Image = "cpa-manager-plus",
    [string]$BuildDate = [DateTime]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ")
)

$ErrorActionPreference = "Stop"

docker build `
    --file "$PSScriptRoot/Dockerfile.manager-server" `
    --tag "${Image}:$Version" `
    --build-arg "VERSION=$Version" `
    --label "org.opencontainers.image.version=$Version" `
    --label "org.opencontainers.image.created=$BuildDate" `
    $PSScriptRoot
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
