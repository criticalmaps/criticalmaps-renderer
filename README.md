# criticalmaps-renderer

Build and run docker container to create video in it:
```
docker build -t criticalmaps-renderer . 
docker run -it -v $(pwd)/phantomjs:/phantomjs criticalmaps-renderer /bin/bash
```

Create stills:
```
phantomjs main.js
```

Render all frames into a video:
```
ffmpeg -framerate 60 -start_number 1 -i frames/frame%d.jpg -vcodec libx264 -filter:v "crop=1920:1080:0:0" output.mp4
```

Append outro and to video rendering:
```
ffmpeg -i assets/intro.mp4 -i main.mp4 -i assets/outro.mp4 -filter_complex "[0:v:0][1:v:0][2:v:0]concat=n=3:v=1[outv]" -map "[outv]" upload.mp4
```
