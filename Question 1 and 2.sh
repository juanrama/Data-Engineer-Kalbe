#!/bin/bash

# Variables for question 1
path="/hdfs/data/data1"
name_of_directory="data1"

# Variables for question 2
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path"

# Check if the directory exists
if [ -d "$target_dir/$name_of_directory" ]; then
    echo "$name_of_directory ditemukan!"
    
    # Copy the file from source directory to target directory
    cp "$source_dir/$filename_excel" "$target_dir/$name_of_directory/"
    
    # Check if the copy operation was successful
    if [ $? -eq 0 ]; then
        echo "File $filename_excel berhasil dipindah."
        
        # Create a log file with "File Moved Successfully" content
        echo "file merhasil dipindah" > "$target_dir/$name_of_directory/log.txt"
    else
        echo "gagal memindahkan $filename_excel ke $target_dir/$name_of_directory"
    fi
else
    echo "$name_of_directory tidak ada!"
    
    # Create the directory
    mkdir -p "$target_dir/$name_of_directory"
    
    # Check if the directory creation was successful
    if [ $? -eq 0 ]; then
        echo "membuat $name_of_directory didalam $target_dir"
        
        # Copy the file from source directory to target directory
        cp "$source_dir/$filename_excel" "$target_dir/$name_of_directory/"
        
        # Check if the copy operation was successful
        if [ $? -eq 0 ]; then
            echo "File $filename_excel berhasil dipindah."
            
            # Create a log file with "File Moved Successfully" content
            echo "file berhasil dipindahkan" > "$target_dir/$name_of_directory/log.txt"
        else
            echo "gagal memindahkan $filename_excel ke $target_dir/$name_of_directory"
        fi
    else
        echo "gagal membuat $name_of_directory di dalam $target_dir"
    fi
fi