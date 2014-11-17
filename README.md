English
===== 
`audioextrator.sh` extracts audio from video files.

It can extract audio losslessly from video file using FFmpeg, because it **does not transcode**.

It supports almost all of the video containers and supports the most common audio codecs :

`aac` `ac3` `mp3` `mp2` `ogg` `wma` `dts` `flac`

It supports ffmpeg parameter, e.g. If you want to extract part of audio, you can use `-ss` and/or `-to`

`-ss` means start time, `to` means stop time .so `-ss 100 -to 170` means extract audio from 100s to 170s

you can also use it to cut Audio Files without any losses, but **it could get wrong** ....

**Usage:** 

`extractaudio Filename`

`extractaudio Filename -ss time-to-start -to time-to-stop`

**Requires:**

* [`ffmpeg`](http://www.ffmpeg.org/)

**Examples:**

    ./audioextrator.sh testfile.mp4

    sh audioextrator.sh testfile.flv
    
    sh audioextrator.sh testfile.flv -ss 100 -to 160

**Install:**

    sudo mv audioextrator.sh /usr/local/bin/audioextrator.sh
    sudo chmod 755 /usr/local/bin/audioextrator.sh

**Inspired by and Thanks to [NoNoNo](https://github.com/NoNoNo/shellscripts-extractaudio)**

**See also:**

* [Wikipedia: *Comparison of container formats*](http://en.wikipedia.org/wiki/Comparison_of_container_formats)
* [How to compile FFmpeg on MacOS X](http://blog.mameso.com/2010/04/ffmpeg-fur-mac-osx-10-6-compilieren/)

中文
=======
`audioextrator.sh` 可以将视频中的音轨导出出来。

因为使用的 FFmpeg 直接复制源音频， **不进行转码** ，所以是无损截取。

支持大部分视频容器，支持很多常用音频格式：

`aac` `ac3` `mp3` `mp2` `ogg` `wma` `dts` `flac`

支持部分 ffmpeg 参数，例如，使用 `-ss` 和/或 `-to` 导出部分音频。

`-ss` 表示起始时间, `to` 表示停止时间。 `-ss 100 -to 170` 就表示导出100秒到170秒间的音频。

你也可以用以上参数来无损剪辑音频，但是有可能出问题

（个人测试过截flac会出问题，截取的FLAC文件信息不对--例如虽然截好了但在播放器里显示总时间还是不变。）

**使用方法:** 

`extractaudio 文件名`

`extractaudio 文件名 -ss 开始时间 -to 停止时间`

**依赖:**

* [`ffmpeg`](http://www.ffmpeg.org/)

**实例:**

    ./audioextrator.sh testfile.mp4

    sh audioextrator.sh testfile.flv
    
    sh audioextrator.sh testfile.flv -ss 100 -to 160

**安装:**

    sudo mv audioextrator.sh /usr/local/bin/audioextrator.sh
    sudo chmod 755 /usr/local/bin/audioextrator.sh

**感谢 [NoNoNo](https://github.com/NoNoNo/shellscripts-extractaudio)给予灵感。**

**另见:**

* [Wikipedia: *Comparison of container formats*](http://en.wikipedia.org/wiki/Comparison_of_container_formats)

