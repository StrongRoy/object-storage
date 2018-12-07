#! /bin/bash

# Build web and other services

cd  ~/go/src/richie.com/richie/object-storage/chapter2/apiServer
env GOOS=linux GOARCH=amd64 go build -o ../../bin/apiServer

cd  ~/go/src/richie.com/richie/object-storage/chapter2/dataServer
env GOOS=linux GOARCH=amd64 go build -o ../../bin/dataServer



