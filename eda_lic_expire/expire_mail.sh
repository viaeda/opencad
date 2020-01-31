#!/bin/bash

# File Name: expire_mail.sh
# Author: Qi Wu <qi.wu@outlook.com>
# Created Date: 2020-01-31
# Last Modified: 2020-01-31 17:47:08
# Tel: +86-18601683566
# REV: 


custom_date=`date  -d  "+7 days" +%d-"%b-%Y"  |tr A-Z  a-z`
cat ./expired_data |while  read line
do
    expired_date=`echo $line|awk '{print $2}'`
    expired_feature=`echo $line|awk '{print $1}'`
    if [ "$expired_date"x = "$custom_date"x ];then
        echo "$expired_feature  will  be  expired($expired_date) , please  check!"  |mail  -s  "License expire Tips:`date +%Y-%m-%d`"  qi.wu@outlook.com
    fi

done

