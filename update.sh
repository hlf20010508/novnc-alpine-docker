#! /bin/bash

sudo docker stop firefox-telegram
sudo docker rm firefox-telegram
sudo docker rmi firefox-telegram-novnc
sudo docker compose up -d
