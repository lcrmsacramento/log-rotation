#!/bin/bash

LAST_WEEK=$(date --date="-7 days" +%Y%m%d)

LOG_NAME="logger"

RE='^[0-9]+$'

for filename in *;
do 		
	if [[ "${filename/$LOG_NAME}"=="$filename" ]] ;
	then	
		EXTENSION=${filename##*.}
		if [[ $EXTENSION =~ $RE ]] ; then
			if [[ $LAST_WEEK -ge $EXTENSION ]] ; then
				rm $filename
			fi
		fi
	fi
done
