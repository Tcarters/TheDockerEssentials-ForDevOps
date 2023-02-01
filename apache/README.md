# Apache2 running in Docker

A sample web server running in a Docker 

- To build The image locally
```Build The image
   docker build -t "name-new-image:tag" .
```
- Run a container from this image
```Running 
   docker container run -dit --name container1 -p 8000:80 tcdocker2021:apache2_lunar:v1
```

