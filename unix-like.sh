set -e
if [ $INPUT_VERSION = latest ]; then
    version=$(gh api repos/Jelly-RDF/cli/releases/latest -q .tag_name); 
else 
    version=$INPUT_VERSION; 
    if [ ${version:0:1} != 'v' ]; then version="v$version"; fi
fi
if [ $RUNNER_OS = 'Linux' ]; then
    osname="linux";
else 
    osname="mac";
fi
arch=$(uname -m)
if [ $arch = "aarch64" ]; then
    arch="arm64"
fi
mkdir "$RUNNER_TOOL_CACHE/jelly-cli"
wget --progress=dot:mega -O "$RUNNER_TOOL_CACHE/jelly-cli/jelly-cli" "https://github.com/Jelly-RDF/cli/releases/download/$version/jelly-cli-$osname-$arch"
chmod +x "$RUNNER_TOOL_CACHE/jelly-cli/jelly-cli"
echo "$RUNNER_TOOL_CACHE/jelly-cli" >> $GITHUB_PATH
