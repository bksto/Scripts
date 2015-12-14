#!/bin/bash

# Simulates "find" linux command using the following as an example: 
# ./my_find.sh $HOME -name core -type f -print -exec /bin/rm -f {} \;

if [ $1 = "." ]; then
    spath=$PWD
else
    spath="$1"
fi
shift 
typematch=f 

while [ $# -ge 1 ]; do
	case $1 in
		-name)
			shift
			filematch=$1
			;;
		-type)
			shift
			typematch=$1
			;;
		-print)
		 	;;
		 -exec)
		 	shift
		 	cmdmatch=$@
		 	cmd=$(echo $cmdmatch | tr -d "{};")
		 	;;
	esac
	shift 

#echo "$i" 
done


for file in $(ls -R $spath)
	do
        if [ -z $filematch ]; then
			echo "./$file"
		elif [ -$typematch $spath/$file -a $file == $filematch ]; then
			echo "./$file"
            if [ ! -z "$cmd" ]; then
			    $cmd $spath/$file
            fi
		fi
	done 
