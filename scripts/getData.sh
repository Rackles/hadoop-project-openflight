#! /bin/bash

if  ! [ -d /tmp/openflight ] 
then
    mkdir /tmp/openflight
fi

cd /tmp/openflight
curl http://193.196.37.32/openflight/airlines.dat >> airlines.dat
curl http://193.196.37.32/openflight/airports.dat >> airports.dat
curl http://193.196.37.32/openflight/planes.dat >> planes.dat
curl http://193.196.37.32/openflight/routes.dat >> routes.dat

exit 0;