# criticalmaps-renderer

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


Attach outro to video rendering:
```
ffmpeg -i "concat:output.avi|outro.avi" -c copy final.avi
```

ffmpeg -framerate 60 -start_number 1 -i frames/frame%d.png -c:v libx264 output.mp4
