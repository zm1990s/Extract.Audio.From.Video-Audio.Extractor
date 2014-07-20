#!/bin/bash
if [ ! -f "$1" ] ; then
  echo -e "\e[36m\naudioextrator.sh 2014 by MinZhang"
  echo -e "https://github.com/zm1990s/AudioExtrato\n"
  echo "Extracts the audio track of a video file without transcoding:"
  echo "Support almost all of the video containers, like mp4, mkv, flv, avi, m4v"
  echo "Support servel most common audio codecs, mp3, aac, ac3, flac, ogg, dts\e[m"
  echo -e "\e[35m\n Usage:    ./audioextrator.sh Filename \n Example:  ./audioextrator.sh test.mp4\n\e[m"
  echo -e "\e[36mThis script supports extract part of the Audio by using:"
  echo -e "\e[35m '-ss time-to-start -to time-to-stop' parameter, 'time' is in seconds"
  echo  -e "\n Example: ./audioextrator.sh test.mp4 -ss 100 -to 200\e[m"
  echo -e "\e[36mwhich will extract the audio between 100s and 200s"
  echo -e "\nyou can also use -to without -ss (vise versa), which means 'start--to--time.you.set'"
  echo -e " \e[35mExample: ./audioextrator.sh test.mp4 -to 200\n\e[m"
  echo -e "PS, actually it supports all of the ffmpeg parameters, so use if you needed,\n    just remember I had make it only focus on extract audio\n"
  
  exit
fi
which ffmpeg>/dev/null||notify-send "you have to install FFmpeg"

audiocount=`ffmpeg -i "$1" 2>&1|grep "Audio:"|wc -l`
AUDIOCODEC=$(ffmpeg -i "$1" 2>&1 |grep "Audio:"|nl)

if [ $audiocount -lt 2 ]
then
tracknum=`echo $AUDIOCODEC|awk '{print $3}' |sed 's/#//'`
echo "There is only one track, extracting ..."
else
echo "The video contains following audio tracks:"
echo "${AUDIOCODEC}"
echo "Please select one of them to extract"
read selectedtrack
AUDIOCODEC=$(ffmpeg -i "$1" 2>&1 | grep Stream | grep "Audio:" |nl |grep "    $selectedtrack")
tracknum=`echo $AUDIOCODEC|awk '{print $3}' |sed 's/#//'`
fi


echo start............................
case $AUDIOCODEC in
*aac*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".aac && STATUSTEXT="Saved as $1.aac"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*mp3*)
 ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".mp3 && STATUSTEXT="Saved as $1.mp3"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*ac3*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".ac3 && STATUSTEXT="Saved as $1.ac3"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*wmav2*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".wma && STATUSTEXT="Saved as $1.wma"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*vorbis*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".ogg && STATUSTEXT="Saved as $1.ogg"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*dts*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".dts && STATUSTEXT="Saved as $1.dts"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*flac*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".flac && STATUSTEXT="Saved as $1.flac"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*mp2*)
ffmpeg -loglevel 0 -i "$@" -vn -acodec copy -map "$tracknum" "$1".mp2 && STATUSTEXT="Saved as $1.mp2"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*)
echo -e "\e[31m unknown audio codecs, exiting... sorry about that \n you can report an issue to Github and I'll try to fix it \e[m"
exit 1
;;
esac

echo -e "\n $STATUSTEXT\n"

