#!/bin/bash

: <<COMMENT

This script ssh's to acrental01,2 and runs the local find.py script
with whatever args you pass to this .sh. The args should be search
criterias you wish to invoke in the python script.

./get_records <critera1> <critera2>

NOTE passing remote python arguments

 the arguments array is expanded and passed to script
 -u             # returns totally unbuffer stdin stdout in binary mode
 -              #
 $@             # shell var for expanded array

 this is in contrast to how bash does it
 ssh -q $node "bash -s" < script.sh

COMMENT

HOST=rental

echo Reporting...

for node in $(grep $HOST /etc/hosts | awk '{print$3}'); do
  echo $node
  ssh -q $node python -u - $@ < find.py
done

