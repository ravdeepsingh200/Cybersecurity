#!bin/bash

path=(/etc/shadow/ /etc/passwd/)

#print out permissions
for path in ${path[@]}
do 
 ls -l $path 
done
