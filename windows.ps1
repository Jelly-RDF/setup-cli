$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest

if ($env:INPUT_VERSION -eq "latest") {
    $version=(gh api repos/Jelly-RDF/cli/releases/latest -q .tag_name) 
} elseif ($env:INPUTVERSION.StartsWith("v")) {
    $version=$env:INPUTVERSION
} else {
    $version="v" + $env:INPUTVERSION
}
New-Item $env:RUNNER_TOOL_CACHE\jelly-cli -ItemType Directory -Force
Invoke-WebRequest https://github.com/Jelly-RDF/cli/releases/download/$version/jelly-cli-windows-x86_64.exe -OutFile $env:RUNNER_TOOL_CACHE\jelly-cli\jelly-cli.exe
Add-Content $env:GITHUB_PATH $env:RUNNER_TOOL_CACHE\jelly-cli