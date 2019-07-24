#!/bin/bash

read -p "student number :" num
read -sp "pass :" pass

#curl -O https://bootstrap.pypa.io/get-pip.py

python3 get-pip.py --user --proxy="http://${num}:${pass}@157.114.16.93:8080"

echo "export PATH=$HOME/.local/bin:\$PATH" >> ~/.bashrc
source .bashrc

