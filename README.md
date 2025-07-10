[![GitHub Action Marketplace](https://img.shields.io/badge/GitHub%20Action-Marketplace-blue)](https://github.com/marketplace/actions/setup-jelly-cli) [![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/Jelly-RDF/setup-cli/test.yml)](https://github.com/Jelly-RDF/setup-cli/actions) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Discord](https://img.shields.io/discord/1333391881404420179?label=Discord%20chat)](https://discord.gg/A8sN5XwVa5)

# Setup Jelly CLI for GitHub Actions
Setup [Jelly CLI](https://github.com/Jelly-RDF/cli) in GitHub Actions to use `jelly-cli`.
By default the action finds and downloads the latest version.
Implemented as a composite action.

Note: Currently only Linux x86_64 runners are supported.

## Usage 
Simply run the action before `jelly-cli` usage.

```
steps:
  - uses: Jelly-RDF/setup-cli@v1
    
  - run: jelly-cli rdf to-jelly input.ttl > output.jelly
```

## Inputs
### `version` (optional)
Version of the Jelly CLI to install, e.g., `v0.5.0`. Default: `latest`

### `token` (optional)
GitHub token to use when searching the latest release. Unused if version is provided. Default: `${{ github.token }}`

### Example
```
- uses: Jelly-RDF/setup-cli@v1
  version: 'v0.5.0'
  token: ${{ secrets.GITHUB_TOKEN }}
```
