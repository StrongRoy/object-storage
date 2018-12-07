#!/bin/bash

curl -v 172.16.2.2:12345/objects/test2 -XPUT -d"this is object test2"

echo "put"
curl 172.16.2.2:12345/locate/test2
echo
curl 172.16.2.1:12345/objects/test2
echo