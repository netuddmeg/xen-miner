# xenminer

- how use docker container to mine

```sh
# CHANGE <ACCOUNT> TO YOUR EVM ADDRESS

# use docker run a single container
docker run -it --rm \
    -e ACCOUNT=0xF120007d00480034fAf40000e1727C7809734b20 \
    -e STAT_CYCLE=100000 \
    -e DIFFICULTY=1 \
    -e MEMORY=120 \
    -e CORE=1 \
    cnsumi/xen-miner:latest \
    -d

# use docker compose run scaleable container
# know your machine cpu cores num first
nproc --all # 8

docker compose up --scale miner=8 -d
# this will run 8 container to mine
```

# donate

EVM: `0xF120007d00480034fAf40000e1727C7809734b20`
