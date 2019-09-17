#!/bin/sh

DATA=$(curl -s 'https://api.coinmarketcap.com/v2/ticker/' | jq -r '.data ."1" .quotes .USD .price')
#echo $DATA
printf "%0.0f\n" $DATA
