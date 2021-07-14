#!/bin/sh

date_name=$(date +%Y%m%d)
pod_source_path="$HOME/.cache/plasma_engine_potd"
pod_path="$HOME/pod_bkp"
pod_log_file="$pod_path/log/log_$date_name.log"
pod_bkp_path="$pod_path/$date_name"

find_dir_or_create() {
    if [ -d "$1" ]; then
        echo "directory  $1 exists" 
        return 0
    else
        echo "directory  $1 not exists" 
        echo "creating dir $1" 
        mkdir "$1" --parent
        return 0
    fi
    return 1 
}

find_dir_or_create "$pod_path" 

clear_logs() {
    echo "clar logs"
    rm "$pod_path/log_*.log" -rf
} 

{
    printf "\n###   Begin...   ###\n\n"
    
    find_dir_or_create "$pod_bkp_path" 
    
    clear_logs 

    echo "copying $pod_source_path to $pod_bkp_path..." 

    rsync -va --info=progress2 "$pod_source_path/" "$pod_bkp_path/" 

    ls -la "$pod_bkp_path"

    printf "\n###   The End!   ###"

} >> "$pod_log_file"
