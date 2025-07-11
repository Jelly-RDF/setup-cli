set -e
if [ $INPUT_VERSION = latest ]; then
    version=$(gh api repos/Jelly-RDF/cli/releases/latest -q .tag_name); 
else 
    version=$INPUT_VERSION; 
    if [ ${version:0:1} != 'v' ]; then version="v$version"; fi
fi
wget -O /opt/jelly-cli "https://github.com/Jelly-RDF/cli/releases/download/$version/jelly-cli-linux-x86_64"
chmod +x /opt/jelly-cli
echo '/opt' >> $GITHUB_PATH