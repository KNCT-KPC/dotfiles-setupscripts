#!/bin/bash

read -p "student number :" num
read -sp "pass :" pass
echo "\n"
read -p "package name :" pack

pip install ${pack} --user --proxy="http://${num}:${pass}@157.114.16.93:8080"



