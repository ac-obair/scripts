### day to day

This repo will contain odds and ends automated things that don't really need to be categorised on their own, until such times that there's enough of them to warrnant that.

#### yum_history

This script takes a formal argument of the package you'd like to investigate. It then search yum history for the your user i.e. the user running the script to see if you have - in the life of the box - updated, removed or other wise modified the system packages. Or more specifically the system package name that you specify. Note that this arg can be a partial string and doesn't need to be exact. 

The reason for this script was for tracking down a rouge update that'd broken a mysql implementation due to selinux issues. Running the following even pulls up the error that happened during the update process.

 `sudo yum_history.sh mysql`

**Note** that `$SUDO_USER` is used so using sudo will not caputre your user as root. However you will need sudo access to run the yum commands. 

