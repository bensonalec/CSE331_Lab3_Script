# CSE 331 Lab 3 Docker Image and Bash Script

## Description
This repository provides instructions for using a docker container to run the simplescalar hardware simulator, and a bash script to execute the simulations needed to perform analysis in Lab3 of CSE 331.  

## Commands to get started

First, clone this repo  
```Bash
git clone https://github.com/bensonalec/CSE331_Lab3_Script
```
Then, pull the simple scalar docker image  
```Bash
docker pull khaledhassan/simplescalar
```
Then, execute this command to run the simple scalar docker image (Note that when you run this and the docker container starts, the prompt on the left hand side will be root@dockerID:/, you will need this dockerID in the next step)  
```Bash
docker run -it khaledhassan/simplescalar bash
```
Navigate to the cloned directory, and copy the script over to the docker image  
```Bash
docker cp script.sh dockerID:/simplescalar/
```
Inside the docker container (the initial terminal)  
```Bash
chmod u+x script.sh
./script.sh
```
