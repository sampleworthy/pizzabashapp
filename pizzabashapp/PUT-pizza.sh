#!/bin/bash

itemNumber=1
name="Cheese Pizza"
description="Savor our classic Cheese Pizza—perfectly baked crust topped with premium mozzarella and tangy marinara sauce. Pure indulgence in every bite!"
small_price=7.99
medium_price=10.99
large_price=12.99

if [ -f pizza.json ]; then
        if jq --exit-status '.[] | select(.itemNumber == '$itemNumber')' pizza.json > /dev/null; then
                jq --argjson item "$itemNumber" \
                     --arg name "$name" \
                     --arg desc "$description" \
                     --argjson sp "$small_price" \
                     --argjson mp "$medium_price" \
                     --argjson lp "$large_price" \
                '
                map(
                    if .itemNumber == $item then
                        .name = $name |
                        .description = $desc |
                        (.pricing[] | select(.size == "small").price) = $sp |
                        (.pricing[] | select(.size == "medium").price) = $mp |
                        (.pricing[] | select(.size == "large").price) = $lp
                    else
                        .
                    end
                )
                ' pizza.json | sponge pizza.json
                echo "Item number $itemNumber has been updated."
        else
                echo "Item number $itemNumber does not exist."
        fi
else
        echo "pizza.json file does not exist"
fi