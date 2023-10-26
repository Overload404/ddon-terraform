sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
git clone https://github.com/sebastian-heinz/Arrowgene.DragonsDogmaOnline.git
cd Arrowgene.DragonsDogmaOnline/
sudo sed -i "s/127.0.0.1/$(curl http://169.254.169.254/latest/meta-data/public-ipv4)/g" ./Arrowgene.Ddon.Shared/Files/Assets/GameServerList.csv
sudo docker compose up -d