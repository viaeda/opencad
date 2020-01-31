#!/bin/bash

# File Name: license_monitor.sh
# Author: Qi Wu <qi.wu@outlook.com>
# Created Date: 2020-01-31
# Last Modified: 2020-01-31 17:50:59
# Tel: +86-18601683566
# REV: 

# Create expired_data
rm  -rf  ./expired_data
touch    ./expired_data

# add the features in the follow format
# feature_name,license-port@server-host-name,printable_license_name
license_details=( 
"zip_ZS4XtorMemBaseLib,27020@172.16.11.34,27020@172.16.11.34_zip_ZS4XtorMemBaseLib"
"HAPS-70-AMBA-XTOR-MASTER,27020@172.16.11.34,27020@172.16.11.34_HAPS-70-AMBA-XTOR-MASTER"
"ACS,27020@172.16.11.34,27020@172.16.11.34_ACS"
"adv_checker,27000@172.16.11.35,27000@172.16.11.35_adv_checker"
"SPECCTRA_HP,5280@172.16.10.23,5280@172.16.10.23_SPECCTRA_HP"
"COSLITE_ACCESS,5280@172.16.10.23,5280@172.16.10.23_COSLITE_ACCESS"
"ACCEL_MEM_PLUS,5280@172.16.11.28,5280@172.16.11.28_ACCEL_MEM_PLUS"
"Encounter_C,5280@10.21.11.38,5280@10.21.11.38_Encounter_C"
"XT_ISS_TURBO,27000@172.16.10.23,27000@172.16.10.23_XT_ISS_TURBO"
"caldesignrev,1717@172.16.11.37,1717@172.16.11.37_caldesignrev"
)

# Stop editing from here.
outstring=" "
for lic in ${license_details[@]}
do

feature=`echo $lic|awk -F, '{print $1}'`
server=`echo $lic|awk -F, '{print $2}'`
lic_name=`echo $lic|awk -F, '{print $3}'`

availability=`lmstat  -c $server -i  $feature  |sed -n "10p"  |awk -F ' ' '{print $5}' `


echo $lic_name "          " $availability  >>  ./expired_data
done

