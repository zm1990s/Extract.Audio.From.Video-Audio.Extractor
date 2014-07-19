#!/bin/bash
if [ "$1" = "" ] ; then
  echo -e "\e[36m\naudioextrator.sh 2014 by MinZhang"
  echo -e "https://github.com/zm1990s/AudioExtrato\n"
  echo "Extracts the audio track of a video file without transcoding:"
  echo "Support almost all of the video containers, like mp4, mkv, flv, avi, m4v"
  echo "Support servel most common audio codecs, mp3, aac, ac3, flac, ogg, dts"
  echo -e "\n Usage:    ./audioextrator.sh Filename \n Example:  ./audioextrator.sh test.mp4\n\e[m"
  exit
fi
which ffmpeg>/dev/null||notify-send "you have to install FFmpeg"
AUDIOCODEC=$(ffmpeg -i "$1" 2>&1 | grep Stream | grep Audio)
echo $AUDIOCODEC
#echo "${AUDIOCODEC}" | grep mp3 &> /dev/null
echo start............................
case $AUDIOCODEC in
*aac*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".aac && STATUSTEXT="Saved as $1.aac"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*mp3*)
 ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".mp3 && STATUSTEXT="Saved as $1.mp3"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*ac3*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".ac3 && STATUSTEXT="Saved as $1.ac3"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*wmav2*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".wma && STATUSTEXT="Saved as $1.wma"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*vorbis*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".ogg && STATUSTEXT="Saved as $1.ogg"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*dts*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".dts && STATUSTEXT="Saved as $1.dts"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*flac*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".flac && STATUSTEXT="Saved as $1.flac"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*mp2*)
ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".mp2 && STATUSTEXT="Saved as $1.mp2"|| STATUSTEXT="FFmpeg quit unsuccessfully!"
;;
*)
echo -e "\e[31m unknown audio encodecs, exiting... sorry about that \n you can report an issue to Github and I'll try to fix it \e[m"
exit 1
;;
esac


echo
echo "The video contains this audio track:"
echo "${AUDIOCODEC}"
echo "${STATUSTEXT}"
echo
