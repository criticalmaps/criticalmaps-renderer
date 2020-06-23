# criticalmaps-renderer

```
docker build -t criticalmaps-renderer . 
docker run -it -v $(pwd)/phantomjs:/phantomjs criticalmaps-renderer /bin/bash
```

Create stills:
```
phanomjs main.js
```

Render all frames into a video:
```
ffmpeg -framerate 60 -start_number 1 -i frames/frame%d.png -vcodec flashsv -filter:v "crop=1920:1080:0:0" output.avi
```

Create outro from image:
```
ffmpeg -loop 1 -f image2 -i bla.png -r 30 -vcodec flashsv -t 20 outro.avi
```

Attach outro to video rendering:
```
ffmpeg -i "concat:output.avi|outro.avi" -c copy final.avi
```
