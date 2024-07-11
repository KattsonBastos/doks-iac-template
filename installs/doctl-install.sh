
echo "## Installing doctl.."

cd /tmp
wget https://github.com/digitalocean/doctl/releases/download/v1.104.0/doctl-1.104.0-linux-amd64.tar.gz

tar xf doctl-1.104.0-linux-amd64.tar.gz

sudo mv ./doctl /usr/local/bin

rm doctl-1.104.0-linux-amd64.tar.gz

echo "--------"
echo "## Doctl Instalation finished!"