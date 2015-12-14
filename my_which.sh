#!/bin/bash

# Simulates "which" linux command

# Example:
# BSs-Macbook-Pro:Desktop BrittanySeto$ ./my_which.sh ls
# /bin/ls         

IFS=: 
read dirpath << END
$PATH
END


while [ $# -ge 1 ]; do
for dir in $dirpath
	do 
		if [ -e $dir/$1 ]; then	
            echo "$dir/$1"
        fi
	done 
	shift
done
