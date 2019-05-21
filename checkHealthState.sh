#!/bin/bash
count=0
myArr=$(journalctl | grep healthStateChanged | awk '{printf $9; print $11}' | awk '{for (i=1; i<=NF; i++) print $i}')

serviceArray=()
badArray=() #array for storing daemons that have triggered a '1' to healthStateChanged
#service[0]='blips'
statusArray=()


for i in ${myArr[@]}		#iterate over every daemon that has triggered to healthStateChanged
do 
 service="$(echo "${i}" | awk -F ',' '{print $1}')"  #parsing
 serviceArray[$count]=$service
 status="$(echo "${i}" | awk -F ',' '{print $2}')"  
 
 if [ $status == '1' ]; then
  badArray+=("$service") 			#mark the daemon as a potentially bad if a '1' is found	
 fi 
 
 kount=0
 for k in ${badArray[@]}         #each daemon will be compared with the 'badArray' 
 do
  if [ $k == $service ]; then		#if the daemon in question has been encountered before
	 if [ $status == '0' ]; then	#check to see if we can unmark it as bad if the status has returned to 0
	  unset badArray[$kount]
	 fi
  fi
 ((kount++))
 done
 
 statusArray[$count]=$status 
 ((count++))

done

#echo ${serviceArray[@]}
#echo ${statusArray[@]}
#badArray+="blips"
#echo ${badArray[0]}
#unset badArray[1]
echo ${badArray[@]}

