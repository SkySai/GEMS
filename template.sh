#!/bin/bash
count=1
myArr=$(<yourCommandHere> | awk '{for (i=1; i<=NF; i++) print $i}') #your command goes here#
for i in ${myArr[@]}
do 
 printf $count
 echo $i
 #apply your logic here#
  ((count++))
done