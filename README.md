# standalone:

## Ubuntu linux 20.04 LTS:

0. sudo apt update && sudo apt install git python3.10-venv python3-pip -y
1. git clone https://github.com/jacklevin74/xenminer.git
2. cd xenminer
3. python3 -m venv .
4. source ./bin/activate
5. pip install argon2_cffi passlib tqdm requests
6. python miner.py

## windows 11 subsystem:

1. python -m venv myenv1  
2. myenv1\Scripts\activate
3. python -m pip install argon2_cffi
4. python -m pip install passlib
5. python -m pip install tqdm
6. python -m pip install requests
7. python miner.py

## Raspberry Pi (debian/ubuntu):

1. sudo -i
2. apt install git
3. cd /opt
4. git clone https://github.com/jacklevin74/xenminer.git
5. cd xenminer/
6. apt-get install python3-venv
7. python3 -m venv ./env
8. source ./env/bin/activate
9. pip install argon2_cffi passlib tqdm requests 
13. nano miner.py (change address)
14. nohup python miner.py &
15. tail nohup.out -f

## to pull new version:
git reset —hard
git pull origin main
(Change address)
Run

# Docker:
##  Add Docker's official GPG key:

sudo apt-get update && sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

##  Add the repository to Apt sources:

echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update

##  Install docker:

echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

## docker run a single container

docker run -it --rm \
    -e ACCOUNT=0x626d95Faf2AbfAe1E3f6dd714DbD36107272d257 \
    -e STAT_CYCLE=100000 \
    -e DIFFICULTY=1 \
    -e CORE=1 \
    cnsumi/xen-miner:latest \
    -d

# install Docker Composer:

curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o  docker-compose-linux-x86_64

sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

### use docker compose run scaleable container know your machine cpu cores num first:

nproc --all # 8

###  this will run 8 container to mine

docker compose up --scale miner=8 -d

# donate
EVM: `0xF120007d00480034fAf40000e1727C7809734b20`
