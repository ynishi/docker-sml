# docker-sml

* Docker image for Standard ML of New Jersey https://www.smlnj.org/
* Base image is ubuntu.
* DockerTags = version-${sml ver}-${image version}

## build
```
docker build -t sml:latest .
```

## run
### just run repl with below.
```
docker run --rm -it ynishi/docker-sml
# or local build
docker run --rm -it sml
```
### reuse container(ex. for hisotry)
```
docker run -it --name sml ynishi/docker-sml || docker start -i sml
```
### pass opts for rlwrap by env
```
docker run --rm -it -e RLWRAP_OPTS="-s 10000" ynishi/docker-sml
```
### use file example
```
echo "fun f n = n;" > test.sml
docker run --rm -it -v $(pwd):/app ynishi/docker-sml
- use "test.sml";
[opening test.sml]
val id = fn : 'a -> 'a
val it = () : unit
- id 1;
val it = 1 : int
```
### run bash in
```
docker run --rm -it --entrypoint=bash ynishi/docker-sml
```

## LICENSE
* MIT, see LICENSE.
