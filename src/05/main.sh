#!/bin/bash

start_time=$(date +%s.%N)
. ../functions
. ../checks
. ../detect_colors

if ckeck_number_of_args $@ && check_existing_dir $1
then
    total_folders=$(find ${1} -mindepth 0 -mount -type d 2>/dev/null| wc -l)
    total_files=$(find ${1} -type f 2>/dev/null | wc -l)
    total_conf=$(find ${1} -type f -name "*.conf" 2>/dev/null| wc -l)
    total_text=$(file $(find ${1} -type f 2>/dev/null) | awk '/ASCII text/ || /UTF-8 Unicode text/'| wc -l)
    total_exec=$(file $(find ${1} -type f 2>/dev/null) | grep executable | wc -l)
    total_log=$(find ${1} -type f -name "*.log" 2>/dev/null | wc -l)
    total_arch=$(file $(find ${1} -type f 2>/dev/null) | awk '/compressed/ || /archive/' | wc -l)
    total_symb=$(ls -lR ${1} 2>/dev/null | grep '^l' | wc -l)
    if check_end_slash $1 && check_path_existence_arg $1  
    then
        echo -en "Total number of folders (including all nested ones) = ${total_folders} \n\n"
        echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
        top_five_dir $1
        echo -en "${top_five_folders}\n"
        echo -en "Total number of files = ${total_files} \n\n"
        echo -en "Configuration files (with the .conf extension) = ${total_conf} \n\n"
        echo -en "Text files = ${total_text} \n\n"
        echo -en "Executable files = ${total_exec} \n\n"
        echo -en "Log files (with the extension .log) = ${total_log} \n\n"
        echo -en "Archive files = ${total_arch} \n\n"
        echo -en "Symbolic links = ${total_symb} \n\n"
        echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
        top_ten_f $1
        echo -en "${top_ten_files}\n"
        echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
        top_ten_exe $1
        echo -en "${top_ten_exe_files}\n"
        echo -en "Script execution time (in seconds) = "
        count_exec_time 
    fi
fi
