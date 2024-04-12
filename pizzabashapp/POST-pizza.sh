#!/bin/bash

itemNumber=2
name="Pepperoni Pizza"
description="Delight in our Pepperoni Pizza, a mouthwatering combination of zesty pepperoni slices layered atop a golden crust, smothered in rich marinara sauce, and sprinkled with melted mozzarella cheese. A timeless favorite that packs a punch of flavor in every bite."
small_price=7.99
medium_price=10.99
large_price=12.99

if [ ! -f pizza.json ] || [ ! -s pizza.json ]; then
    echo "[]" > pizza.json
fi

if jq --exit-status '.[] | select(.itemNumber == '$itemNumber')' pizza.json > /dev/null; then
    echo "Item number $itemNumber already exists."
else
    if jq --argjson item "$itemNumber" \
       --arg name "$name" \
       --arg desc "$description" \
       --argjson sp "$small_price" \
       --argjson mp "$medium_price" \
       --argjson lp "$large_price" \
    '
    . += [{
        "itemNumber": $item,
        "name": $name,
        "description": $desc,
        "pricing": [
            {"size": "small", "price": $sp},
            {"size": "medium", "price": $mp},
            {"size": "large", "price": $lp}
        ]
    }]
    ' pizza.json > temp.json
    then
        mv temp.json pizza.json
        echo "Item number $itemNumber has been added."
    else
        echo "Failed to add item number $itemNumber."
    fi
fi