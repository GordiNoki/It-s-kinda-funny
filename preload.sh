sudo apt update
sudo apt install jq coreutils screen curl openssh-server -y
cd ~
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -q -O ngrok.tgz
tar -xf ngrok.tgz

sudo systemctl start ssh

./ngrok config add-authtoken $NGROK_AUTH_TOKEN
screen -dm ./ngrok tcp 22

sudo ufw disable

sudo useradd -m -s /bin/bash bidgido
sudo usermod -aG sudo bidgido
sudo mkdir -p /home/bidgido/.ssh/
echo $RSA_PUBLIC_KEY | sudo tee /home/bidgido/.ssh/authorized_keys
sudo chown -R bidgido:bidgido /home/bidgido/

echo IP: $(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)
echo User: bidgido
echo Password: passasas
