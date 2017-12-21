FROM ubuntu:trusty

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y build-essential git-core

RUN apt-get install -y libboost-all-dev petsc-dev
RUN apt-get install -y libhdf5-openmpi-dev

WORKDIR /root/ef/
ADD * /root/ef/ 
CMD make

