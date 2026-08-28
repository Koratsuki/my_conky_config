#!/bin/bash
SYMBOL=$1
FIELD=$2

VALUE=$(curl -s "https://api.binance.com/api/v3/ticker/24hr?symbol=${SYMBOL}" | jq -r "$2")

case "$FIELD" in
    '.lastPrice')
        printf "$%.2f\n" "$VALUE"
        ;;
    '.priceChangePercent')
        printf "%+.2f%%\n" "$VALUE"
        ;;
    '.highPrice')
        printf "$%.2f\n" "$VALUE"
        ;;
    '.lowPrice')
        printf "$%.2f\n" "$VALUE"
        ;;
    *)
        echo "$VALUE"
        ;;
esac
