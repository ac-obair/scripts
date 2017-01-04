
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
Two files will be output a reg.json file for further Python manupulation if you require and a plain text list 
of all the paths to the images for the model provided registrations.
