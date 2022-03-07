sudo apt update
sudo apt install jq screen curl -y
cd ~
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar -xf ngrok-stable-linux-amd64.tgz

./ngrok authtoken $NGROK_AUTH_TOKEN
screen -dm ./ngrok tcp 22

ufw disable

passMyWord=`echo "passasas" | openssl passwd -crypt -stdin`
useradd -m -p $passMyWord -s /bin/bash bidgido
usermod -aG sudo bidgido

echo IP: $(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)
echo User: bidgido
ecoh Password: passasas
