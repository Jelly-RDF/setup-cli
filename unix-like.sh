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
wget -O /opt/jelly-cli "https://github.com/Jelly-RDF/cli/releases/download/$version/jelly-cli-$osname-$arch"
chmod +x /opt/jelly-cli
echo '/opt' >> $GITHUB_PATH