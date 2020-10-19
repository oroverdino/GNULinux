# Notas ffmpeg

## trim video
```
ffmpeg -i <source.mp4> -ss 00:00:02 -t 00:00:29 <out.mp4>
```

## create gif from video

1. extract images from video,
the frames dir should be created first
-r 5: FPS value, better q choose bigger number
%03d: for the sequential name
```
aptitude install imagemagick
ffmpeg -i <video.mp4> -r 5 'frames/frame-%03d.jpg'
```

2. convert images to gif
-delay 20: time between each frame
2: 50 fps, 5: 20 fps, 20: 5 fps, 50: 2 fps
```
cd frame
convert -delay 20 -loop 0 *.jpg myGif.gif
```
