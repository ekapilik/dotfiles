#! /usr/bin/env bash

__check_and_install__ docker ${apt_updated:-false}
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
