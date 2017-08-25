# ubuntu-vqmt
Dockerfile for VQMT compilation on Ubuntu


## Build and run the docker container
```bash
$ sudo docker build -t vqmt github.com/h3dema/ubuntu-vqmt
$ sudo docker run -it vqmt
```

## VQMT

If you are running VQMT, you probably want to access some files on your hard disk.
Docker can map a physical directory to a virtual directory inside the container.
To do this, you must provide the -v parameter.

```bash
$ sudo docker run -v /tmp:/videos  -it vqmt
```

To run VQMT, just type vqmt.
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
