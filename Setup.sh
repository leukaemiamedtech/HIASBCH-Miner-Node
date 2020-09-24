#!/bin/sh

echo "!! This program will setup everything you need to use the HIAS Miner Node !!"
echo " "

echo "-- Installing requirements"
echo " "

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum