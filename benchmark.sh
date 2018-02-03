#!/bin/bash

#vps="zvur";
vps="cy-ber";

source="https://raw.githubusercontent.com/brantbell/cream/mei"


# go to root
cd

wget https://raw.githubusercontent.com/brantbell/cream/mei/bench.sh -O - -o /dev/null|bash
