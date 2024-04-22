#!/bin/bash

# Delete a pizza item from the menu
itemNumber=2

if [ ! -f pizza.json ] || [ ! -s pizza.json ]; then
    echo "pizza.json file does not exist or is empty"
else
# Check if item number exists
    if jq --exit-status '.[] | select(.itemNumber == '$itemNumber')' pizza.json > /dev/null; then
        if jq --argjson item "$itemNumber" \
        '
        map(select(.itemNumber != $item))
        ' pizza.json > temp.json
        then
            mv temp.json pizza.json
            # Check if the item was deleted successfully
            echo "Item number $itemNumber has been deleted."
        else
            echo "Failed to delete item number $itemNumber."
        fi
    else
        echo "Item number $itemNumber does not exist."
    fi
fi