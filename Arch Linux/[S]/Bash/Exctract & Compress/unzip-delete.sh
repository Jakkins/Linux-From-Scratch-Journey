#!/bin/bash

#for ((i=0; i<=3; i++)); do
#	 ./MyProgram.exe "$filename" "Logs/$(basename "$filename" .txt)_Log$i.txt"
#done

for file in ./*.zip; do
	unzip ${file}
done

for file in ./*; do
	if [ ${file: -4} == ".nfo" ]
	then
		echo ${file}
		rm ${file}
	fi
	if [ ${file: -4} == ".zip" ]
	then
		echo ${file}
		rm ${file}
	fi
done
