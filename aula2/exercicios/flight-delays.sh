#!/bin/bash

source functions.sh

while getopts ":dns" opt; do
    case ${opt} in
        d ) # process option h
            shift # Removes de First Argument from the queue
            download_datasets $1
        ;;
        
        n ) # count_delayed_flights
            shift
            count_delayed_flights $1
        ;;

        s ) # download supplemental data
            shift
            download_sup_data $1
        ;;

        \? ) echo "Usage: flight-delays.sh [-d] [-n] [-s]"
        ;;
  esac
done
