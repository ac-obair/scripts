#!/bin/bash

package=$1

echo checking if $SUDO_USER has ever updated $package

yum history list | while read line; do
   read -r -a H <<<"$(echo  | awk '{print $1,$3}')" &&
   {
   if [[ "${H[1]}" == *"$SUDO_USER"* ]]; then
       yum history info ${H[0]} | grep -i $package
       if [[ $? -eq 0 ]]; then
          echo "id of transaction was ${H[0]} you can now run 'yum history info ${H[0]}'"
      fi;
   fi
   };
done
