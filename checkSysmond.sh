#!/bin/bash
isActive=$(systemctl status sysmond --no-pager | grep 'Active' | awk '{print $2}')
Status=$(systemctl status sysmond --no-pager | grep 'Status:' | awk '{print $2}')
#echo $isActive
#echo $Status

if [ $isActive == 'active' ] && [ $Status == '"Ready"' ]; then
 echo sysmond is good
else 
 echo $(systemctl status sysmond --no-pager | grep 'Active' )
 echo $(systemctl status sysmond --no-pager | grep 'Status:' )
fi