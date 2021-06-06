#!/bin/bash
# Andrew Samost
# myfind
#
# Description: searches for a filename within the current directory and returns
# 			   the name of the file if found and an error if not; with no argument
#			   returns all files within the current directory in a list
#
# Input:	   input can be no arguments which returns all files in the current directory,
#			   or one argument that is a valid filename (string with no spaces) which returns
#			   if the file is within the current directory or not
#
# Output:	   Output is either a list of all files within the current directory if there are no arguments,
#			   if the file is in the current directory it will print out the filename, and if it isn't in the
#			   current directory it will print out an error message saying there is no such file


bool=0
if [ $# -eq 0 ] # if no arguments show all files
then
	ls -1
	let bool=2
else
	for file in $(ls)
	do
		if [ $1 == $file ]
		then
			let bool=1
		fi
	done

	if [ $bool -eq 0 ]
	then
		echo "find: '$1': No such file"
	else
		echo $1
	fi
fi