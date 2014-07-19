`audioextrator.sh` extracts audio from video files.

It uses FFmpeg as backend can extracts audio losslessly from video file, because it **do not transcodes**.

It support almost all of the video file types and support the most common audio encodes :

`aac` `ac3` `mp3` `mp2` `ogg` `wma` `dts` `flac`

**Usage:** `extractaudio Filename` 

**Requires: **

* [`ffmpeg`](http://www.ffmpeg.org/)

**Examples:**

    ./audioextrator.sh testfile.mp4
  
    sh audioextrator.sh testfile.flv

**Install:**

    sudo mv audioextrator.sh /usr/local/bin/audioextrator.sh
    sudo chmod 755 /usr/local/bin/audioextrator.sh
    
**Inspired by and Thanks to [NoNoNo](https://github.com/NoNoNo/shellscripts-extractaudio)**
    
**See also:**

* [Wikipedia: *Comparison of container formats*](http://en.wikipedia.org/wiki/Comparison_of_container_formats)
* [Easy YouTube Video Downloader](http://www.yourvideofile.com/) is a free addon for Firefox, Google Chrome, Opera and Safari that adds a nice download button to every YouTube page
* [How to compile FFmpeg on MacOS X](http://blog.mameso.com/2010/04/ffmpeg-fur-mac-osx-10-6-compilieren/)

