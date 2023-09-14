## Overview

Introduction:  

This proof of work miner is based on Argon2ID algorithm which is both GPU and ASIC resistant.
It allows all participants to mine blocks fairly.  Your mining speed is directly proportional to 
the number of miners you are running (you can run many on a single computer).  The difficulty of 
mining is auto adjusted based on the verifier node algorithm which aproximately targets production
speed of 1 block per second.

# standalone:

## Ubuntu linux 20.04/22.04 LTS:

```sudo apt update && sudo apt install git python3.10-venv python3-pip -y
git clone https://github.com/netuddmeg/xen-miner.git
cd xenminer
python3 -m venv .
source ./bin/activate
pip install argon2_cffi passlib tqdm requests
python miner.py
```

## windows 11 subsystem:

```python -m venv myenv1  
myenv1\Scripts\activate
python -m pip install argon2_cffi
python -m pip install passlib
python -m pip install tqdm
python -m pip install requests
python miner.py
```

## Raspberry Pi (debian/ubuntu):

```sudo -i
apt install git
cd /opt
git clone https://github.com/jacklevin74/xenminer.git
cd xenminer/
apt-get install python3-venv
python3 -m venv ./env
source ./env/bin/activate
pip install argon2_cffi passlib tqdm requests 
nano miner.py (change address)
nohup python miner.py &
tail nohup.out -f
```

## to pull new version:
```
git reset —hard
git pull origin main
```
Change address and run.

# Docker:
##  Add Docker's official GPG key:

```
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

##  Add the repository to Apt sources:

```
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

##  Install docker:

```
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

## docker run a single container

```
docker run -it --rm \
    -e ACCOUNT=0x626d95Faf2AbfAe1E3f6dd714DbD36107272d257 \
    -e STAT_CYCLE=100000 \
    -e DIFFICULTY=1 \
    -e CORE=1 \
    cnsumi/xen-miner:latest \
    -d
```

# install Docker Composer:

```
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o  docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### use docker compose run scaleable container know your machine cpu cores num first:

```
nproc --all # 8
```

###  this will run 8 container to mine

```
docker compose up --scale miner=8 -d
```

# donate
EVM: `0xF120007d00480034fAf40000e1727C7809734b20`
