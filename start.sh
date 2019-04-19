#!/bin/bash

git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf git://

read -p "student number :" num
read -sp "pass :" pass

export https_proxy="http://${num}:${pass}@157.114.16.93:8080"
export http_proxy="http://${num}:${pass}@157.114.16.93:8080"

git config --global http.proxy http://${num}:${pass}@157.114.16.93:8080
git config --global https.proxy http://${num}:${pass}@157.114.16.93:80$
git config --global url."https://".insteadof git://

echo "Add the -E option to sudo to run apt "



