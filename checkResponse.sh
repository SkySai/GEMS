#!/bin/bash
count=1
IFS=$'\n'
myArr=($(journalctl | grep 'did not response' )) #your command goes here#

echo ${myArr[1]}
for i in ${myArr[@]}
do 
# echo $i
 #apply your logic here#
  ((count++))
done