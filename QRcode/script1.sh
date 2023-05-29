#!/bin/bash

while read line; do
    iso=$(echo $line | cut -d ":" -f1)
    echo "https://bigbrain.biz/$iso"
    docker run --rm -v $(pwd)/qrcode:/qrcode sae103-qrcode qrencode -o /qrcode/"$iso" "https://bigbrain.biz/$iso"
done <  region.conf

docker container prune -f