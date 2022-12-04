#!/bin/sh


for a in "$@";
do
	if [ "$a" = "-f" ];
	then
		url=$(bingimage)
		curl -s $url > ~/Scripts/setimage_src/temp.jpg
		cp ~/Scripts/setimage_src/temp.jpg  ~/Scripts/setimage_src/copy.jpg
		easyrice ~/Scripts/setimage_src/copy.jpg ~/Scripts/setimage_src/temp.jpg
		wal -c
		wal --saturate 1.0 -i ~/Scripts/setimage_src/temp.jpg
		exit 0
	fi
done
wal -c
wal --saturate 1.0 -e -i ~/Scripts/setimage_src/temp.jpg
