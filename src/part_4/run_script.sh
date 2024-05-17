#!/bin/bash

sudo docker build -t leatrice .
echo ""
echo "Image created successfuly! Let's get it:"
echo
sudo docker images
echo "Run our container"
sudo docker run -d -p 80:81 --name nginx_4 leatrice
echo
echo "Server is running"
echo "Compiling the mini server file and run nginx"
echo
sudo docker exec nginx_4 gcc mini_server.c -lfcgi -o mini_server
sudo docker exec nginx_4 spawn-fcgi -p 8080 ./mini_server
sudo docker exec nginx_4 service nginx start
echo
echo "This is our server"
curl localhost:80
echo
echo
echo "This is our server/status"
curl localhost:80/status
