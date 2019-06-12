#!/bin/bash
count=1
myArr=()
gshell='Sysmond.getSystemServicesHealth'  ## your gshell command here
delimiter=","                             ## the delimiter you want to use to parse the text into tokens
myArr=$(gshell -c "$gshell" -c exit | awk -F "$delimiter" '{for (i=1; i<=NF; i++) print $i}') 
for i in ${myArr[@]}
do 
 printf $count
 echo $i
 #apply your logic here#
  ((count++))
done
