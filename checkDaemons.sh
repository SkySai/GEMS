#!/bin/bash
count=1
#numfields=$(gshell -c "Sysmond.getSystemServicesHealth" -c exit | awk -F',' ' { print NF  } ')
myArr=$(gshell -c "Sysmond.getSystemServicesHealth" -c exit | awk -F ',' '{for (i=1; i<=NF; i++) print $i}')


serviceArray=()
#service[0]='blips'
statusArray=()

for i in ${myArr[@]}
do 
 service="$(echo "${i}" | awk -F ':' '{print $1}')" 
 serviceArray[$count]=$service 
 status="$(echo "${i}" | awk -F ':' '{print $2}')"
 if [ $status == '"failed"' ]; then
  echo "{$service} has failed"
 fi 
 statusArray[$count]=$status 
 ((count++))
# echo $i
done
#echo ${serviceArray[@]}
#echo ${statusArray[@]}
#echo ${myArr[1]}
#test[0]='blips'
#echo ${test[1]}
