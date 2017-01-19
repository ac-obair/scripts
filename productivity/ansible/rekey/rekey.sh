#!/bin/bash

repo=$1

for path_to_secret in $(find $HOME/Devops/$repo/group_vars -name secrets.yml -type f); do
     	./rekey.exp $path_to_secret;
done
