# Setup Jelly CLI for GitHub Actions
Setup [Jelly CLI](https://github.com/Jelly-RDF/cli) in GitHub Actions to use `jelly-cli`.
By default the action finds and downloads the latest version.
Implemented as a composite action.

Note: Currently only Linux x86_64 runners are supported.

## Usage 
Simply run the action before `jelly-cli` usage.

```
steps:
  - name: Setup yt-dlp
    uses: Jelly-RDF/setup-cli@v1
    
  - run: jelly-cli rdf to-jelly input.ttl > output.jelly
```

## Inputs
### `version` (optional)
Version of the Jelly CLI to install, e.g. `v0.4.8`. Default: `latest`

### `token` (optional)
GitHub token to use when searching the latest release. Unused if version is provided. Default: `${{ github.token }}`
