#!/bin/bash

# return list of airports with delayed flights
if [[ -f $1 ]]; then
    origin=$(awk -F, '{ if($15 > 0) {print} }' $1 | awk -F, '{print $17}' | tail -n +2 | sort | uniq)
    dest=$(awk -F, '{ if($16 > 0) {print} }' $1 | awk -F, '{print $18}' | tail -n +2 | sort | uniq)

    airports=$(echo -e "${origin}\n${dest}" | sort | uniq)

    echo "Aeroportos com voos atrasados:"

    for air in ${airports[@]}
    do
        # Create airport quoted
        air_quoted='"'
        air_quoted+="$air"
        air_quoted+='"'

        airports_name=$(awk -F, -v var="$air_quoted" '{if ($1 == var) {print} }' ./data/airports.csv)

        echo "$airports_name"
    done
else
    echo "O arquivo não existe"
fi