<h1 style="font-weight:normal">
  <a href="">
    <img src="https://cdn.jsdelivr.net/gh/NeeDKK/cloudimg@master/data/logo.png" alt="needkk" width=35>
  </a>
  &nbsp;face-opencv-base
  <a href=""><img src="https://img.shields.io/static/v1?label=face-opencv-base&color=green&message=start now"/></a>
  <a href="" target="_blank"><img src="https://img.shields.io/static/v1?label=release&color=blue&message=latest"/></a>

</h1>

通过Ubuntu作为基础镜像构建拥有opencv+golang+dlib环境，通过golang调用opencv和dlib进行人脸识别。
golang基础包 go-face + gocv-go 通过两个开源包分别处理人脸识别图片打码和视频打码。

## 构建自己的opencv+go+dlib基础镜像

>
> ```shell
> docker login -u xxxx -p xxxx
> docker build -f Dockerfile -t opencv-face-base:latest .
> docker tag opencv-face-base:latest xxxx/opencv-face-base:latest
> docker push xxxx/opencv-face-base:latest
> ```
>

