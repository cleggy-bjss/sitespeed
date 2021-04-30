#/bin/bash
cd /sitespeed
docker run --shm-size=1g --network=3g --rm -v "$(pwd):/sitespeed.io" sitespeedio/sitespeed.io:17.1.1 --config sitespeed-config.json "$1"