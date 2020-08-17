#!/bin/bash

# return list of companies with delayed flights
if [[ -f $1 ]]; then
    companies=$(awk -F, '{ if(($15 > 0) || ($16 > 0)) {print} }' $1 | awk -F, '{print $9}' | sort | uniq)
    
    echo "Companhias com voos atrasados:"

    for comp in ${companies[@]}
    do
        # Create companie quoted
        comp_quoted='"'
        comp_quoted+="$comp"
        comp_quoted+='"'

        companies_name=$(awk -F, -v var="$comp_quoted" '{if ($1 == var) {print $2} }' ./data/carriers.csv | head)

        echo "$companies_name"
    done
else
    echo "O arquivo não existe"
fi