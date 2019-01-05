# docker-ircddbgateway
Docker'd ircddbgateway

This project uses docker and docker-compose for management. https://docs.docker.com/compose/

# Getting Started

Download this project and unzip it: https://github.com/VE3LSR/docker-ircddbgateway/archive/master.zip

# Running

Edit the file `config/ircddbgateway` 
run `docker-compose up -d` to start.

# Updating

Updating is as simple as `docker-compose pull; docker-compose down; docker-compose up -d`

# Building

If you'd like to build locally, just run `docker-compose build`

You will require `ircddbgatewayd`. This can be from other packages, or the build project.
