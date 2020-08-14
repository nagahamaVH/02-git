#!/bin/bash

source functions.sh

while getopts ":dtn" opt; do
    case ${opt} in
        d ) # process option h
            shift # Removes de First Argument from the queue
            download_datasets $1
        ;;
        
        t ) # process option t
        ;;
        
        n ) # count_delayed_flights
            shift
            count_delayed_flights $1
        ;;

        \? ) echo "Usage: flight-delays.sh [-d] [-t]"
        ;;
  esac
done
