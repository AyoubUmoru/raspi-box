#!/bin/bash
SRVROLENAME="ssm"

set -e

#pushd

sudo wget https://www.amazontrust.com/repository/AmazonRootCA1.pem
sudo wget https://www.amazontrust.com/repository/SFSRootCAG2.pem

openssl x509 -inform PEM  -in AmazonRootCA1.pem -outform PEM -out AmazonRootCA1.crt
openssl x509 -inform PEM  -in SFSRootCAG2.pem -outform PEM -out SFSRootCAG2.crt

sudo mkdir /usr/share/ca-certificates/local
sudo cp AmazonRootCA1.crt /usr/share/ca-certificates/local/AmazonRootCA1.crt
sudo cp SFSRootCAG2.crt /usr/share/ca-certificates/local/SFSRootCAG2.crt

sudo dpkg-reconfigure ca-certificates
#popd