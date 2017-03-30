
### get_car_by_reg.py
List of registrations for particular model passed to this script as csv from database
Bash can then be used with the output to extract the files from the root images directory.

#### example:
`./get_car_by_reg.py <images subdirectory> <model>.csv`


csv must be in the format of
```
XXXXXXX
AAAAAAA
SSSSSSS
DDDDDDD
FFFFFFF
```

#### expected output:
Two files will be output a `reg.json` file for further Python manupulation if you require and a `reg.txt` plaintext list 
of all the paths to the images for the csv model provided registrations.

Assuming you have enough space on the partition and have checked the total size of the images you're about to move you can now extract them:
```
read -pr "enter car model: " model
mkdir ${model}_images/ && {
    for each in $(cat reg.txt); do cp -R $each ${model}_images/; done
}
```
