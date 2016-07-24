#!/bin/bash
#function:cut odoo log files for 8.0
#author: http://odoo123.com

#set the path to odoo log files
log_files_path="/var/odoo/"
log_files_dir=${log_files_path}$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")
#set odoo log files you want to cut
log_files_name=(access odoo123 leangjia)
#set the path to odoo.
odoo_sbin="/etc/init.d/odoo"
#Set how long you want to save
save_days=30

############################################
#Please do not modify the following script #
############################################
mkdir -p $log_files_dir

log_files_num=${#log_files_name[@]}

#cut odoo log files
for((i=0;i<$log_files_num;i++));do
mv ${log_files_path}${log_files_name[i]}.log ${log_files_dir}/${log_files_name[i]}_$(date -d "yesterday" +"%Y%m%d").log
done

#delete 30 days ago odoo log files
find $log_files_path -mtime +$save_days -exec rm -rf {} \; 

$odoo_sbin restart
