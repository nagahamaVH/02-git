#!/bin/bash


function download_datasets {
    if [[ -d "$1" ]]; then
        echo "Baixando arquivo de 2006"
        wget -q 'https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/HG7NV7/EPIFFT' -O "${1}/2006.csv.bz2"
        echo "Baixando arquivo de 2007"
        wget -q 'https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/HG7NV7/2BHLWK' -O "${1}/2007.csv.bz2"

        if [[ ! -f "${1}/2006.csv" ]]; then
            echo "Descompactando arquivo de 2006"
            bzip2 -dk "${1}/2006.csv.bz2"
        fi

        if [[ ! -f "${1}/2007.csv" ]]; then
            echo "Descompactando arquivo de 2007"
            bzip2 -dk "${1}/2007.csv.bz2"
        fi
        exit 0
    else
        echo "Destino do download não existe"
        exit 1
    fi
}
