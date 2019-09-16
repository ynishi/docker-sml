# docker-sml

* Docker image for Standard ML of New Jersey https://www.smlnj.org/
* Base image is ubuntu. 

## build
```
docker build -t sml:latest .
```

## run
* entrypoint style, just run repl with below.
```
docker run --rm -it sml
```
* use file example
```
echo "fun x = {x}" > test.sml
docker run --rm -it -v $(pwd):/app sml

- use "test.sml";
[opening test.sml]
val id = fn : 'a -> 'a
val it = () : unit
- id 1;
val it = 1 : int
```
* run bash in
```
docker run --rm -it --entrypoint=bash sml
```

## LICENSE
* MIT, see LICENSE.