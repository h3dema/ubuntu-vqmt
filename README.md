# ubuntu-vqmt
Dockerfile for VQMT compilation on Ubuntu


## Build and run the docker container
```bash
$ sudo docker build -t vqmt github.com/h3dema/ubuntu-vqmt
$ sudo docker run -it vqmt
```

## VQMT

To run VQMT, just type vqmt at the prompt.
Note that it requires 9 parameters:

```bash
$ vqmt OriginalVideo ProcessedVideo Height Width NumberOfFrames ChromaFormat Output Metrics
```

* OriginalVideo: the original video as raw YUV video file, progressively scanned, and 8 bits per sample 
* ProcessedVideo: the processed video as raw YUV video file, progressively scanned, and 8 bits per sample 
* Height: the height of the video 
* Width: the width of the video 
* NumberOfFrames: the number of frames to process 
* ChromaFormat: the chroma subsampling format. 0: YUV400, 1: YUV420, 2: YUV422, 3: YUV444 
* Output: the name of the output file(s) 
* Metrics: the list of metrics to use: PSNR, SSIM, MSSSIM, VIFP, PSNRHVS, PSNRHVSM

See more info at  http://mmspg.epfl.ch/vqmt  and  https://github.com/Rolinh/VQMT

# Example

Suppose we have a video server with a file original.mp4 that can be streamed (e.g using RTSP).
In a wireless client, we see the video (using some video player) and download (as downloaded.mp4) it to our computer.
We can use VQTM to compare these videos.
First we need to convert these two files to YUV format. See [ffmped repository](https://github.com/h3dema/ubuntu-ffmpeg) for a container with ffmpeg, that can provide this conversion tool, and also some sample command formats to perform the conversion.

If you are running VQMT, you probably want to access the videos on your hard disk.
Docker can map a physical directory to a virtual directory inside the container.
To do this, you must provide the -v parameter.

```bash
$ sudo docker run -v /tmp:/videos  -it vqmt
```
Move (or copy) the converted video files to the /tmp directory on the physical computer.
In the container, you can run:

```bash
$ vqmt original.yuv downloaded.yuv 520 360 30 1 vqtm_output PSNR SSIM
```

So, the first and second parameters are the video files. You must know the video height and width, and the number of frames.
If you use the example shown in [ffmped repository](https://github.com/h3dema/ubuntu-ffmpeg), the YUV format is YUV420, so ChromaFormat=1 (sixth parameter). In this example, vqtm's output start with "vqtm_output" prefix.
You have to provide at least one metric, but you can select more than one at once, like our example that shows 2 metrics.
