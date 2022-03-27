#!/bin/bash
if [[ $1 == ?(-)+([1-9]) ]] && [[ $2 == ?(-)+([1-9]) ]]
then 
	echo $[$1*$2]
else
	echo "not a number or number equal to 0"
fi
