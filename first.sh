#!/bin/bash
echo "Automatic Ubuntu Set-up"
sudo -l > /dev/null

#Updates and upgrades user system
echo "== Updating and upgrading system =="
sudo apt-get -y update > /dev/null
sudo apt-get -y upgrade > /dev/null
echo "== System updated and upgraded. =="

if [[ -d Tools/ ]] 
then
echo "Directory already exists, exiting.."
	exit 0
fi

mkdir Tools 
cd Tools/
echo "== Tools directory created =="

sudo apt-get install -y git > /dev/null
sudo apt-get install -y python3 > /dev/null
sudo apt-get install -y python3-pip > /dev/null
echo "== Dependencies installed =="

echo "== Installing recon tools =="
git clone --quiet https://github.com/sherlock-project/sherlock.git > /dev/null
cd sherlock
python3 -m pip install -r requirements.txt > /dev/null
cd ..

echo "== Installing scanning and enum tools =="
sudo apt-get install -y nmap > /dev/null
sudo apt-get install -y gobuster > /dev/null

git clone --quiet https://www.github.com/threat9/routersploit
cd routersploit
python3 -m pip install -r requirements.txt > /dev/null
cd ..

git clone --quiet https://github.com/danielmiessler/SecLists.git > /dev/null

echo "== Installing Other Tools =="
git clone --quiet https://github.com/bitbrute/evillimiter.git
cd evillimiter
sudo python3 setup.py install &> /dev/null
cd .. 

sudo apt-get install -y john > /dev/null
